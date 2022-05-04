// "use strict";
//遍历文件夹下的所有文件，最后输出文件夹下所有的文件名
//思路 使用fs，path 模块
//1、先读取文件夹，获取文件的所有文件
//2、对获取的文件进行遍历，用fs.stat 获得文件状态，
//3、通过状态中的stat.isFile()判断是否是一个文件，是文件直接输出文件名，不是文件就继续递归。
const fs = require("fs");
const path = require("path");

const statFile = function (filepath) {
  return new Promise((resolve) => {
    fs.stat(filepath, function (err, stat) {
      if (stat.isFile()) {
        //stat 状态中有两个函数一个是stat中有isFile ,isisDirectory等函数进行判断是文件还是文件夹
        resolve([filepath]);
      } else {
        resolve(listFiles(filepath));
      }
    });
  });
};

const listFiles = function (cwd) {
  return new Promise((resolve) => {
    const fileList = [];
    fs.readdir(cwd, async (err, files) => {
      if (err) throw err;
      for (let file of files) {
        // 拼接获取绝对路径，fs.stat(绝对路径,回调函数)
        let fPath = path.join(cwd, file);
        // fileList = fileList.concat(yield statFile(fPath));
        fileList.push(...(await statFile(fPath)));
      }
      resolve(fileList);
    });
  });
};

const readFile = function (filepath) {
  return new Promise((resolve) => {
    fs.readFile(filepath, (err, content) => {
      resolve(content.toString());
    });
  });
};

const isFileExist = function (filepath) {
  return new Promise((resolve) => {
    fs.access(filepath, fs.constants.F_OK, (err) => {
      if (err) {
        resolve(false);
      } else {
        resolve(true);
      }
    });
  });
};

module.exports = { listFiles, readFile, isFileExist };
