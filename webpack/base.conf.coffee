path = require 'path'
HtmlWebpackPlugin = require 'html-webpack-plugin'
# ExtractTextPlugin = require 'extract-text-webpack-plugin'

autoprefixer = require 'autoprefixer'
bemSuit = require 'postcss-bem'
nested = require 'postcss-nested'
simpleVars = require 'postcss-simple-vars'
alias = require 'postcss-alias'
crip = require 'postcss-crip'

module.exports =
  entry: './doc/main.coffee'
  output:
    path: path.join __dirname, './dist'
    publicPath: '/'
    filename: 'dist/build.js'
  plugins: [
    new HtmlWebpackPlugin
      # filename: '../../index.html'
      template: path.join __dirname, '../doc/index.jade'
    # new ExtractTextPlugin 'styles.css'
  ]
  # resolve:
  #   extensions:
  #     alias:
  #     src:
  module:
    loaders: [
        test: /\.vue$/
        loader: 'vue'
      ,
        test: /\.jade$/
        loader: 'jade-loader'
      ,
        test: /\.coffee$/
        loader: 'coffee-loader'
        exclude: /node_modules/
      ,
        test: /\.styl$/
        loader: 'style!css!postcss!stylus'
      ,
        test: /\.css$/
        loader: 'style!css'
      ,
        test: /\.(png|jpg|gif|svg)$/
        loader: 'url'
        query:
          limit: 10000
          name: '[name].[ext]?[hash]'
    ]
  postcss: (webpack) -> [
    bemSuit

    # TODO 合并
    alias
    crip()

    autoprefixer
      browsers: [
        '> 1%'
        'last 2 version'
        'Firefox >= 20'
        'ie >= 8'
      ]
  ]
