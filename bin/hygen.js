#!/usr/bin/env node

const PATH = require('path');
const FS = require('fs');

const Hygen = require('hygen');
const Logger = require('hygen/lib/logger');

const templates = PATH.resolve([__dirname, '..', 'templates'].join(PATH.sep));

if (!FS.existsSync(templates)) {
    process.stderr.write(`\nInvalid tempates folder: ${templates}\n\n`);
    process.exit(1);
}

/* eslint-disable no-console, import/no-extraneous-dependencies, global-require */
Hygen.runner(process.argv.slice(2), {
    templates,
    cwd: process.cwd(),
    logger: new Logger(console.log.bind(console)),
    createPrompter: () => require('inquirer'),
    exec(action, body) {
        const opts = body && body.length ? { input: body } : {};
        return require('execa').shell(action, opts);

    },
});
/* eslint-enable no-console, import/no-extraneous-dependencies, global-require */
