# PostCSS-Demo

* http://postcss.org/
* https://github.com/postcss/postcss

实质是打造专属的预处理器

* http://ai.github.io/postcss-way/

## 调研总结

### 语言层面的扩展

目前较不完善。尤其是 mixins 传入变量后，做逻辑分支。
为 CSS 造 流程控制 语法 感觉意义不大。
退一步说，瘦 DSL 中 预处理器 已经 比较成熟；
进一步说，真要在 CSS 里面写逻辑，不如 直接 使用 JS 的语法了，
这可能是 模块化 CSS 的另一个思路。

### 值得使用的 除语法层面外的 插件

* 可以放在 后处理流程 中
  * autoprefixer
  * cssnano
* 模块化 命名 规则，bemSuit，需整合至 预处理环节
* 至于 缩写 可以根据喜好，前、后处理都可以

## Plugins

### Pack（the way all in one）

* cssnano
* cssnext
* precss
* rucksack

### alone

* Extensions (语法扩展)
* Colors
* Images
  * SVG
* Fonts
* Grid（栅格系统）
  * lost
  * postcss-grid
  * postcss-neat
* Shortcuts（缩写）
* Media-queries（媒体查询）
* Fallbacks（兼容性）
* Analysis & Reporters
* Optimizations（优化）
  * 压缩
  * 代码修改
* Fun

#### alias

自定义别名

[postcss-alias](https://github.com/seaneking/postcss-alias)

```css
@alias {
  fs: font-size;
  fw: font-weight;
  bg: background;
}

.foo {
  fs: 16px;
  fw: 400;
  transition: bg 200ms ease;
}
```

#### crip

预置别名，可扩展

[postcss-crip](https://github.com/johnie/postcss-crip)

EX.
```
f -> font
bg -> background
bgz -> background-size
w -> width
h -> height
p -> padding
m -> margin
pos -> position
```

[Crip list all in here](https://github.com/johnie/crip-css-properties)

#### magician

[postcss-font-magician](https://github.com/jonathantneal/postcss-font-magician)

```css
/* before */

body {
  font-family: "Alice";
}

/* after */

@font-face {
  font-family: "Alice";
  font-style: normal;
  font-weight: 400;
  src: local("Alice"), local("Alice-Regular"),
    url("http://fonts.gstatic.com/s/alice/v7/sZyKh5NKrCk1xkCk_F1S8A.eot?#") format("eot"),
    url("http://fonts.gstatic.com/s/alice/v7/l5RFQT5MQiajQkFxjDLySg.woff2") format("woff2"),
    url("http://fonts.gstatic.com/s/alice/v7/_H4kMcdhHr0B8RDaQcqpTA.woff")  format("woff"),
    url("http://fonts.gstatic.com/s/alice/v7/acf9XsUhgp1k2j79ATk2cw.ttf")   format("truetype")
}

body {
  font-family: "Alice";
}
```

#### triangle

三角形

[postcss-triangle](https://github.com/jedmao/postcss-triangle)

* 等腰三角形

```css
.isosceles-triangle {
  triangle: pointing-<up|down|left|right>;
  width: <length>;
  height: <length>;
  background-color: <color>;
}

/* ex. */

.isosceles-triangle {
  triangle: pointing-right;
  width: 150px;
  height: 115px;
  background-color: red;
}
```

* 直角三角形

```css
.right-isosceles-triangle {
  triangle: right-iso pointing-<up|down|left|right>;
  <width|height>: <length>;
  background-color: <color>;
}

/* ex. */

.right-isosceles-triangle {
  triangle: right-iso pointing-down;
  width: 250px;
  background-color: red;
}
```

* 等边三角形

```css
.equilateral-triangle {
  triangle: equilateral pointing-<up|down|left|right>;
  <width|height>: <length>;
  background-color: <color>;
}

/* ex. */

.equilateral-triangle {
  triangle: equilateral pointing-up;
  height: 100px;
  background-color: red;
}
```

#### circle

圆形

[postcss-circle](https://github.com/jedmao/postcss-circle)

```css
.circle {
  circle: <diameter> [color];
}

/* ex. */

.circle {
  circle: 100px red;
}
```

#### linkColors

[postcss-all-link-colors](https://github.com/jedmao/postcss-all-link-colors)

```css
/* before */
a {
  @link-colors all red {
    focus: white;
    hover: blue;
  }
}
/* after */
a {
  color: red;
}
a:visited {
  color: red;
}
a:focus {
  color: white;
}
a:hover {
  color: blue;
}
a:active {
  color: red;
}
```

```css
/* before */
a {
  @link-colors red {
    hover: white;
  }
}
/* after */
a {
  color: red;
}
a:hover {
  color: white;
}
```

#### center

居中

[postcss-center](https://github.com/jedmao/postcss-center)

```css
/* before */
.foo {
  top: center;
  left: center;
}
/* after */
.foo {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-right: -50%;
  transform: translate(-50%, -50%)
}
```

```css
/* before */
.foo {
  top: center;
}
/* after */
.foo {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
}
```

#### clearfix

[postcss-clearfix](https://github.com/seaneking/postcss-clearfix)

```css
/* before */
.foo {
  clear: fix; /* IE8+ */
}

.bar {
  clear: fix-legacy; /* IE6+ */
}
/* after */
.foo:after{
  content: '';
  display: table;
  clear: both;
}

.bar:before,
.bar:after {
  content: '';
  display: table;
}
.bar:after {
  clear: both;
}
.bar {
  zoom: 1;
}
```

#### position

[postcss-position](https://github.com/seaneking/postcss-position)

```css
/* before */
.foo {
  position: absolute 10px 0;
}

.bar {
  position: fixed 0;
}

.baz {
  position: relative 30% auto 0;
}

.fab {
  position: absolute 10px 0 20px 30px;
}
/* after */
.foo {
  position: absolute;
  top: 10px;
  right: 0;
  bottom: 10px;
  left: 0;
}

.bar {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}

.baz {
  position: relative;
  top: 30%;
  right: auto;
  bottom: 0;
  left: auto;
}

.fab {
  position: absolute;
  top: 10px;
  right: 0;
  bottom: 20px;
  left: 30px;
}
```

#### size

[postcss-size](https://github.com/postcss/postcss-size)

```css
/* before */
.two {
  size: 20px 10px;
}
.one {
  size: 10px;
}
/* after */
.two {
  width: 20px;
  height: 10px;
}
.one {
  width: 10px;
  height: 10px;
}
```

#### verthorz

[postcss-verthorz](https://github.com/davidhemphill/postcss-verthorz)

```css
/* before */
.foo {
  padding-vert: 2rem;
  margin-horz: auto;
}
/* after */
.foo {
  padding-top: 2rem;
  padding-bottom: 2rem;
  margin-left: auto;
  margin-right: auto;
}
```

```css
/* before */
.bar {
  ph: 30px;
  mv: 100px;
}
/* after */
.bar {
  padding-left: 30px;
  padding-right: 30px;
  margin-top: 100px;
  margin-bottom: 100px;
}
```

```css
/* before */
.baz {
  padding-vert: 10px 15px;
  margin-horz: 15px 21px;
}
/* after */
.baz {
  padding-top: 10px;
  padding-bottom: 15px;
  margin-left: 15px;
  margin-right: 21px;
}
```

#### color short

[postcss-color-short](https://github.com/andrepolischuk/postcss-color-short)

```css
/* before */
.hello {
  border-bottom: 1px solid rgb(200);
  background: #20;
  color: #f;
  box-shadow: 0 1px 5px rgba(0, 0.5);
}
/* after */
.hello {
  border-bottom: 1px solid rgb(200, 200, 200);
  background: #202020;
  color: #fff;
  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
}
```

#### simple vars

[postcss-simple-vars](https://github.com/postcss/postcss-simple-vars)

```css
/* before */
$dir:    top;
$blue:   #056ef0;
$column: 200px;

.menu_link {
  background: $blue;
  width: $column;
}
.menu {
  width: calc(4 * $column);
  margin-$(dir): 10px;
}
/* after */
.menu_link {
  background: #056ef0;
  width: 200px;
}
.menu {
  width: calc(4 * 200px);
  margin-top: 10px;
}
```

#### mixins

[postcss-mixins](https://github.com/postcss/postcss-mixins)

```css
/* before */
@define-mixin icon $network, $color: blue {
  .icon.is-$(network) {
    color: $color;
    @mixin-content;
  }
  .icon.is-$(network):hover {
    color: white;
    background: $color;
  }
}

@mixin icon twitter {
  background: url(twt.png);
}
@mixin icon youtube, red {
  background: url(youtube.png);
}
/* after */
.icon.is-twitter {
  color: blue;
  background: url(twt.png);
}
.icon.is-twitter:hover {
  color: white;
  background: blue;
}
.icon.is-youtube {
  color: red;
  background: url(youtube.png);
}
.icon.is-youtube:hover {
  color: white;
  background: red;
}
```

#### define property

[postcss-define-property](https://github.com/daleeidd/postcss-define-property)

```css
/* before */
size: $height $width {
  height: $height;
  width: $width;
}

size: $size {
  height: $size;
  width: $size;
}

.rectangle {
  size: 50px 100px;
}

.square {
  size: 50px;
}

/* after */
.rectangle {
  height: 50px;
  width: 100px;
}

.square {
  height: 50px;
  width: 50px;
}
```

#### nested

可按照 dom 结构书写 样式

[postcss-nested](https://github.com/postcss/postcss-nested)

```css
/* before */
.phone {
  &_title {
    width: 500px;
    @media (max-width: 500px) {
      width: auto;
    }
    body.is_dark & {
      color: white;
    }
  }
  img {
    display: block;
  }
}
/* after */
.phone_title {
  width: 500px;
}
@media (max-width: 500px) {
  .phone_title {
    width: auto;
  }
}
body.is_dark .phone_title {
  color: white;
}
.phone img {
  display: block;
}
```

#### import

[postcss-import](https://github.com/postcss/postcss-import)

```css
/* can consume `node_modules`, `web_modules` or local modules */
@import "cssrecipes-defaults"; /* == @import "./node_modules/cssrecipes-defaults/index.css"; */
@import "normalize.css"; /* == @import "./node_modules/normalize.css/normalize.css"; */

@import "css/foo.css"; /* relative to stylesheets/ according to `from` option above */

@import "css/bar.css" (min-width: 25em);

body {
  background: black;
}
```

#### url

url 资源替换

[postcss-url](https://github.com/postcss/postcss-url)

* rebase(default)
* inline
* copy
* {function}

```css
```

#### conditionals

条件支持

[postcss-conditionals](https://github.com/andyjansson/postcss-conditionals)

```css
/* before */
.foo {
  @if 3 < 5 {
    background: green;
  }
  @else {
    background: blue;
  }
}
/* after */
.foo {
  background: green;
}
```

```css
p {
  @if $type == ocean {
    color: blue;
  } @else if $type == matador {
    color: red;
  } @else if $type == monster {
    color: green;
  } @else {
    color: black;
  }
}
```

#### for

循环支持

[postcss-for]()

#### postcss-each

[postcss-each]()

----

# Some other build tools

## Fly

* https://git.io/fly
* https://github.com/bucaran/fly

## Broccoli

* http://broccolijs.com/
* https://github.com/broccolijs/broccoli

## Brunch

* http://brunch.io/
* https://github.com/brunch/brunch
