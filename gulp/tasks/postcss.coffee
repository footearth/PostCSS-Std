gulp = require 'gulp'
stylus = require 'gulp-stylus'
rename = require 'gulp-rename'

postcss = require 'gulp-postcss'

autoprefixer = require 'autoprefixer'
bemSuit = require 'postcss-bem'
nested = require 'postcss-nested'
simpleVars = require 'postcss-simple-vars'
alias = require 'postcss-alias'
crip = require 'postcss-crip'

cssnano = require 'cssnano'

module.exports = ->

  gulp.src './src/stylus/flex/flex.util.styl'

  .pipe stylus()
  .pipe rename 'util/flex.post.css'
  .pipe gulp.dest './dist'

  .pipe postcss [
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
  .pipe rename 'util/flex.css'
  .pipe gulp.dest './dist'

  .pipe postcss [
    cssnano
  ]
  .pipe rename 'util/flex.min.css'
  .pipe gulp.dest './dist'
