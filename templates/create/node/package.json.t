---
to: package.json
---
{
    "name": "<%= name %>",
    "version": "0.0.1",
    "main": "$npm_package_directories_lib",
    "license": "ISC",
    "private": true,
    "collaborators": [
        "Héctor Menéndez <hector@gik.mx>"
    ],
    "directories": {
        "lib": "dist",
        "src": "src"
    },
    "scripts": {
        "start": "nodemon -e js -w $npm_package_directories_src --exec 'npm run -s code:watch'",
        "code:clear": "rm -Rf $npm_package_directories_lib ./node_modules/.cache/@babel",
        "code:lint": "eslint $npm_package_directories_src",
        "code:watch": "npm run code:clear -s && npm run code:lint -s && babel-node src",
        "build": "npm run code:clear -s && babel $npm_package_directories_src --source-maps -d $npm_package_directories_lib"
    },
    "devDependencies": {
        "@babel/cli": "^7.1.2",
        "@babel/core": "^7.1.2",
        "@babel/node": "^7.0.0",
        "@babel/preset-env": "^7.1.0",
        "@gik/eslint-config-node": "0.0.10",
        "babel-plugin-module-resolver": "^3.1.1",
        "eslint": "^5.8.0",
        "eslint-import-resolver-alias": "^1.1.1",
        "nodemon": "^1.18.4"
    }
}
