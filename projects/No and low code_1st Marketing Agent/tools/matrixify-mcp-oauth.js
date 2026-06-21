const crypto = require("crypto");
const fs = require("fs");
const http = require("http");
const path = require("path");
const { execFile } = require("child_process");

const issuer = "https://mcp.matrixify.app";
const port = 13388;
const redirectUri = `http://127.0.0.1:${port}/callback`;
const secretsDir = path.resolve(__dirname, "..", ".secrets");
const tokenPath = path.join(secretsDir, "matrixify-mcp-token.json");
const clientPath = path.join(secretsDir, "matrixify-mcp-client.json");
const authUrlPath = path.resolve(__dirname, "matrixify-mcp-auth-url.txt");
const errorPath = path.resolve(__dirname, "matrixify-mcp-oauth-error.txt");

function base64url(buffer) {
  return buffer
    .toString("base64")
    .replace(/\+/g, "-")
    .replace(/\//g, "_")
    .replace(/=+$/g, "");
}

function randomString(bytes = 32) {
  return base64url(crypto.randomBytes(bytes));
}

async function registerClient() {
  if (fs.existsSync(clientPath)) {
    return JSON.parse(fs.readFileSync(clientPath, "utf8"));
  }

  const res = await fetch(`${issuer}/oauth/register`, {
    method: "POST",
    headers: { "content-type": "application/json", accept: "application/json" },
    body: JSON.stringify({
      client_name: "Codex Matrixify Reporting",
      redirect_uris: [redirectUri],
      grant_types: ["authorization_code", "refresh_token"],
      response_types: ["code"],
      token_endpoint_auth_method: "none",
      scope: "mcp",
    }),
  });

  const text = await res.text();
  if (!res.ok) {
    throw new Error(`Client registration failed (${res.status}): ${text}`);
  }

  const client = JSON.parse(text);
  fs.mkdirSync(secretsDir, { recursive: true });
  fs.writeFileSync(clientPath, JSON.stringify(client, null, 2));
  return client;
}

async function exchangeCode({ code, codeVerifier, clientId }) {
  const body = new URLSearchParams({
    grant_type: "authorization_code",
    code,
    redirect_uri: redirectUri,
    client_id: clientId,
    code_verifier: codeVerifier,
  });

  const res = await fetch(`${issuer}/oauth/token`, {
    method: "POST",
    headers: {
      "content-type": "application/x-www-form-urlencoded",
      accept: "application/json",
    },
    body,
  });

  const text = await res.text();
  if (!res.ok) {
    throw new Error(`Token exchange failed (${res.status}): ${text}`);
  }

  const token = JSON.parse(text);
  fs.mkdirSync(secretsDir, { recursive: true });
  fs.writeFileSync(
    tokenPath,
    JSON.stringify({ acquiredAt: new Date().toISOString(), ...token }, null, 2)
  );
  return token;
}

async function main() {
  const client = await registerClient();
  const clientId = client.client_id;
  if (!clientId) throw new Error("Registration response did not include client_id.");

  const state = randomString(24);
  const codeVerifier = randomString(32);
  const codeChallenge = base64url(
    crypto.createHash("sha256").update(codeVerifier).digest()
  );

  const authUrl = new URL(`${issuer}/oauth/authorize`);
  authUrl.searchParams.set("response_type", "code");
  authUrl.searchParams.set("client_id", clientId);
  authUrl.searchParams.set("redirect_uri", redirectUri);
  authUrl.searchParams.set("scope", "mcp");
  authUrl.searchParams.set("state", state);
  authUrl.searchParams.set("code_challenge", codeChallenge);
  authUrl.searchParams.set("code_challenge_method", "S256");

  const server = http.createServer(async (req, res) => {
    const url = new URL(req.url || "/", redirectUri);
    if (url.pathname !== "/callback") {
      res.writeHead(404, { "content-type": "text/plain" });
      res.end("Not found");
      return;
    }

    try {
      const returnedState = url.searchParams.get("state");
      const error = url.searchParams.get("error");
      const code = url.searchParams.get("code");
      if (error) throw new Error(`Matrixify returned OAuth error: ${error}`);
      if (returnedState !== state) throw new Error("OAuth state did not match.");
      if (!code) throw new Error("OAuth callback did not include a code.");

      await exchangeCode({ code, codeVerifier, clientId });
      res.writeHead(200, { "content-type": "text/html" });
      res.end("<h1>Matrixify MCP connected.</h1><p>You can close this tab and return to Codex.</p>");
      console.log(`Matrixify MCP token saved to ${tokenPath}`);
      server.close(() => process.exit(0));
    } catch (err) {
      res.writeHead(400, { "content-type": "text/html" });
      res.end(`<h1>Matrixify MCP connection failed.</h1><pre>${String(err.stack || err.message || err)}</pre>`);
      console.error(err);
      server.close(() => process.exit(1));
    }
  });

  server.listen(port, "127.0.0.1", () => {
    fs.writeFileSync(authUrlPath, authUrl.toString());
    console.log("Open this Matrixify authorization URL:");
    console.log(authUrl.toString());
    console.log("");
    console.log(`Waiting for callback on ${redirectUri}`);
    execFile("cmd", ["/c", "start", "", authUrl.toString()], (error) => {
      if (error) console.log("Automatic browser open failed. Copy the URL above into Chrome.");
    });
  });
}

main().catch((err) => {
  fs.writeFileSync(errorPath, String(err.stack || err.message || err));
  console.error(err);
  process.exit(1);
});
