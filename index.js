#!/usr/bin/env node

const co = require("co");
const Command = require("./lib/command");

co(function* () {
  yield new Command().run(process.cwd());
}).catch((err) => {
  console.error(err.stack);
  process.exit(1);
});
