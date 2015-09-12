#!/bin/sh 

# webpack --config ./assets/webpack.config.js -p
# -p means Production shortcut -p
# Equals to --optimize-minimize --optimize-occurence-order
# https://github.com/webpack/docs/wiki/cli
webpack --config ./assets/webpack.config.js
