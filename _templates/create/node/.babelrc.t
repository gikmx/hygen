---
to: .babelrc
---
{
    "presets": [
        ["@babel/env", { "targets": { "node": "current" } }]
    ],
    "plugins": [
        ["module-resolver", { "alias": { "~": "./src" } }]
    ]
}
