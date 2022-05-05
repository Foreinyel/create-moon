{
  "name": "{{ appName }}",
  "version": "1.0.0",
  "description": "",
  "private": true,
  "egg": {
    "typescript": true,
    "declarations": true,
    "framework": "@hemyn/moon"
  },
  "scripts": {
    "start": "egg-scripts start --title={{ appName }}",
    "stop": "egg-scripts stop --title={{ appName }}",
    "dev": "egg-bin dev",
    "debug": "egg-bin debug",
    "test-local": "egg-bin test",
    "test": "npm run lint -- --fix && npm run test-local",
    "cov": "egg-bin cov",
    "tsc": "ets && tsc -p tsconfig.json",
    "ci": "npm run lint && npm run cov && npm run tsc",
    "autod": "autod",
    "lint": "eslint . --ext .ts",
    "clean": "ets clean"
  },
  "dependencies": {
    "@hemyn/moon": "^0.0.7"
  },
  "devDependencies": {
    "@types/mocha": "^2.2.40",
    "@types/node": "^7.0.12",
    "@types/supertest": "^2.0.0",
    "autod": "^3",
    "autod-egg": "^1",
    "colors": "^1.4.0",
    "egg-bin": "^4",
    "egg-ci": "^1",
    "egg-mock": "^4",
    "eslint": "^7",
    "eslint-config-egg": "^8.0.0",
    "tslib": "^1.9.0",
    "typescript": "^3.0.0"
  },
  "engines": {
    "node": ">=8.9.0"
  },
  "ci": {
    "version": "8"
  },
  "repository": {
    "type": "git",
    "url": ""
  },
  "eslintIgnore": [
    "coverage"
  ],
  "author": "",
  "license": "MIT"
}
