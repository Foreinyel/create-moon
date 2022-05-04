const Command = require("commander");
const chalk = require("chalk");
const inquirer = require("inquirer");
const path = require("path");
const { listFiles, readFile, isFileExist } = require("./fileHelper");
const nunjucks = require("nunjucks");
const mkdir = require("mkdirp");
const { writeFile } = require("fs/promises");

module.exports = class Command {
  constructor() {}

  *run(cwd, args) {
    console.log(`${chalk.green("creating project with moon.")}`);
    const answer = yield inquirer.prompt({
      name: "appName",
      type: "input",
      message: "please enter package name",
    });
    const tmpDir = path.resolve(__dirname, "../tpl");
    const fileList = yield listFiles(tmpDir);
    for (let file of fileList) {
      const targetFile = path.resolve(
        cwd,
        file.split("/tpl/")[1].replace(".tpl", "")
      );
      if (!(yield isFileExist(targetFile))) {
        const content = yield readFile(file);
        const targetContent = nunjucks.renderString(content, answer);
        const fullDir = targetFile.slice(0, targetFile.lastIndexOf("/"));
        yield mkdir(fullDir);
        yield writeFile(targetFile, targetContent);
      }
    }
    console.log(`${chalk.green("run ")}${chalk.green.bold("npm install")}`);
  }
};
