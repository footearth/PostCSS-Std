echo = console.log
gulp = require 'gulp'
rename = require 'gulp-rename'

postcss = require 'gulp-postcss'

# browserReporter = require 'postcss-browser-reporter'
# reporter = require 'postcss-reporter'

# mqpacker = require 'css-mqpacker'
# csswring = require 'csswring'

# sourcemaps = require 'gulp-sourcemaps'

autoprefixer = require 'autoprefixer'
# opacity =  require 'postcss-opacity'

precss = require 'precss'
cssnano = require 'cssnano'
# cssnext = require 'cssnext'
cssnext = require 'postcss-cssnext'
rucksack = require 'rucksack-css'

bemSuit = require 'postcss-bem'
nested = require 'postcss-nested'
simpleVars = require 'postcss-simple-vars'
mixins = require 'postcss-mixins'
atImport = require 'postcss-import'

alias = require 'postcss-alias'
crip = require 'postcss-crip'

conditionals = require 'postcss-conditionals'

processors = []

postTask = (name, processors) ->

  gulp.src "./src/#{name}/style.post.css"
  .pipe postcss processors
  .pipe rename "#{name}/style.dest.css"
  .pipe gulp.dest './src'

module.exports = ->

  # postTask 'precss', [ precss ]
  # postTask 'cssnano', [ cssnano ]
  # postTask 'cssnext', [ cssnext() ]
  # postTask 'rucksack', [
  #   rucksack
  #     autoprefixer: true
  #     fallbacks: true
  # ]

  gulp.src "./src/bem-suit/flex.post.css"
  .pipe postcss [
    atImport()
    # simpleVars()
    conditionals
    nested
    mixins
    bemSuit
    crip()
      # 'fx-i': [ 'inline-flex' ]
      # 'fx': [ 'flex' ]
    alias
    autoprefixer
  ]
  .pipe rename "bem-suit/flex.dest.css"
  .pipe gulp.dest './src'
