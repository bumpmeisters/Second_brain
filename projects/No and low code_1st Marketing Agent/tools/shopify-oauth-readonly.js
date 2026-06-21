const crypto = require("crypto");
const http = require("http");
const fs = require("fs");
const path = require("path");
const { execFile } = require("child_process");

const store = process.argv[2] || "hk-das-familienbuch.myshopify.com";
const scopes = (process.argv[3] || "read_products").split(",").filter(Boolean);
const clientId = "7e9cb568cfd431c538f36d1ad3f2b4f6";
const port = 13387;
const redirectUri = `http://127.0.0.1:${port}/auth/callback`;

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

const state = randomString(24);
const codeVerifier = randomString(32);
const codeChallenge = base64url(
  crypto.createHash("sha256").update(codeVerifier).digest()
);

const params = new URLSearchParams({
  client_id: clientId,
  scope: scopes.join(","),
  redirect_uri: redirectUri,
  state,
  response_type: "code",
  code_challenge: codeChallenge,
  code_challenge_method: "S256",
});

const authorizationUrl = `https://${store}/admin/oauth/authorize?${params.toString()}`;
const outDir = path.resolve(__dirname, "..", ".shopify-cli-appdata");
const tokenPath = path.join(outDir, "shopify-oauth-session.json");
const urlPath = path.resolve(__dirname, "shopify-oauth-url.txt");

async function exchangeCode(code) {
  const response = await fetch(`https://${store}/admin/oauth/access_token`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      client_id: clientId,
      code,
      code_verifier: codeVerifier,
      redirect_uri: redirectUri,
    }),
  });

  const text = await response.text();
  if (!response.ok) {
    throw new Error(`Token exchange failed (${response.status}): ${text}`);
  }

  const token = JSON.parse(text);
  fs.mkdirSync(outDir, { recursive: true });
  fs.writeFileSync(
    tokenPath,
    JSON.stringify(
      {
        store,
        scopes,
        acquiredAt: new Date().toISOString(),
        associatedUser: token.associated_user || null,
        accessToken: token.access_token,
        refreshToken: token.refresh_token || null,
        expiresIn: token.expires_in || null,
        refreshTokenExpiresIn: token.refresh_token_expires_in || null,
        grantedScope: token.scope || null,
      },
      null,
      2
    )
  );

  return token;
}

const server = http.createServer(async (req, res) => {
  const url = new URL(req.url || "/", redirectUri);
  if (url.pathname !== "/auth/callback") {
    res.writeHead(404, { "Content-Type": "text/plain" });
    res.end("Not found");
    return;
  }

  try {
    const returnedState = url.searchParams.get("state");
    const shop = url.searchParams.get("shop");
    const error = url.searchParams.get("error");
    const code = url.searchParams.get("code");

    if (error) throw new Error(`Shopify returned error: ${error}`);
    if (returnedState !== state) throw new Error("OAuth state did not match.");
    if (!shop || !shop.endsWith(".myshopify.com")) {
      throw new Error("OAuth callback did not include a valid shop.");
    }
    if (!code) throw new Error("OAuth callback did not include a code.");

    await exchangeCode(code);
    res.writeHead(200, { "Content-Type": "text/html" });
    res.end("<h1>Shopify authentication succeeded.</h1><p>You can close this tab and return to Codex.</p>");
    console.log(`\nAuthenticated ${store}. Token saved locally at: ${tokenPath}`);
    server.close(() => process.exit(0));
  } catch (err) {
    res.writeHead(400, { "Content-Type": "text/html" });
    res.end(`<h1>Shopify authentication failed.</h1><pre>${String(err.stack || err.message || err)}</pre>`);
    console.error(err);
    server.close(() => process.exit(1));
  }
});

server.listen(port, "127.0.0.1", () => {
  fs.writeFileSync(urlPath, authorizationUrl);
  console.log("Open this Shopify authorization URL:");
  console.log(authorizationUrl);
  console.log("");
  console.log(`Waiting for callback on ${redirectUri}`);

  execFile("cmd", ["/c", "start", "", authorizationUrl], (error) => {
    if (error) {
      console.log("Automatic browser open failed. Copy the URL above into Chrome.");
    }
  });
});
