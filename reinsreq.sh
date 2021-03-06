#!/usr/bin/env bash

cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

set -e

cd $cwd

cnpm install --save-dev \
  webpack webpack-dev-server

cnpm install --save-dev \
  babel-loader babel-core \
  babel-plugin-transform-runtime babel-preset-es2015 \
  babel-runtime@^5.8.0

# cnpm install --save-dev \
#   vue-html-loader vue-style-loader \
#   vue-hot-reload-api vue-loader

cnpm install --save-dev \
  css-loader

cnpm install --save-dev \
  coffee-script coffee-loader \
  jade jade-loader \
  stylus stylus-loader \
  cson json-loader \
  file-loader url-loader \
  template-html-loader \
  html-webpack-plugin@^2.0.0 \
  style-loader extract-text-webpack-plugin

cnpm install --save-dev \
  lodash \
  ddeyes build-module-task \
  gulp gulp-util run-sequence \
  # gulp-sequence

# cnpm install --save \
#   vue vue-router

cnpm install --save-dev \
  gulp-rename \
  gulp-stylus

cnpm install --save-dev \
  gulp-postcss \
  postcss-loader \
  postcss-alias \
  postcss-crip \
  postcss-simple-vars \
  postcss-bem \
  postcss-nested \
  autoprefixer \
  cssnano

  # postcss-font-magician \
  # postcss-triangle \
  # postcss-circle \
  # postcss-all-link-colors \
  # postcss-center \
  # postcss-clearfix \
  # postcss-position \
  # postcss-size \
  # postcss-verthorz \
  # postcss-color-short

cnpm install --save \
  normalize.css
