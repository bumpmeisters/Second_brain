const fs = require("fs");
const path = require("path");

const tokenPath = path.resolve(__dirname, "..", ".secrets", "matrixify-mcp-token.txt");
const endpoint = "https://mcp.matrixify.app/mcp";

if (!fs.existsSync(tokenPath)) {
  console.error(`Missing token file: ${tokenPath}`);
  process.exit(1);
}

const token = fs.readFileSync(tokenPath, "utf8").trim();

async function mcp(method, params, id) {
  const res = await fetch(endpoint, {
    method: "POST",
    headers: {
      "content-type": "application/json",
      accept: "application/json, text/event-stream",
      authorization: `Bearer ${token}`,
    },
    body: JSON.stringify({ jsonrpc: "2.0", id, method, params }),
  });

  const text = await res.text();
  if (!res.ok) {
    throw new Error(`HTTP ${res.status}: ${text}`);
  }

  const jsonLine = text
    .split(/\r?\n/)
    .map((line) => line.replace(/^data:\s*/, "").trim())
    .find((line) => line.startsWith("{"));

  return JSON.parse(jsonLine || text);
}

(async () => {
  const init = await mcp(
    "initialize",
    {
      protocolVersion: "2025-06-18",
      capabilities: {},
      clientInfo: { name: "codex-matrixify-client", version: "0.1.0" },
    },
    1
  );
  console.log("INITIALIZE");
  console.log(JSON.stringify(init, null, 2));

  const tools = await mcp("tools/list", {}, 2);
  console.log("TOOLS");
  console.log(JSON.stringify(tools, null, 2));
})().catch((err) => {
  console.error(err.stack || err.message || err);
  process.exit(1);
});
