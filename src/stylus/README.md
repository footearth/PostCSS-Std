# BEM && SUIT

* [结合 BEM 和 SUIT 方法使用 PostCSS](http://www.w3cplus.com/PostCSS/using-postcss-with-bem-and-suit-methodologies.html)
* [BEM](https://en.bem.info/)
* [SUIT](http://suitcss.github.io/)
  * https://github.com/suitcss/suit
* [postcss-bem](https://github.com/ileri/postcss-bem)

## BEM Way

* Block (Component)
  * 唯一
  * 排他
  * 具名意义
* Element（元素类型）
  * ex.
    * heading
    * text-field
    * submit-button
* Modifier ( & state)
  * bem 官方
  * bem-like

## SUIT Way

* Utilities (Util)
  * 使用 "u-" 前缀
  * 首字母小写
  * 驼峰命名
* Components (Block)
  * 使用 "nmsp-" 前缀
  * 首字母大写
  * 驼峰命名
* Descendants (Element)
  * 使用 "-" 连接
  * 首字母小写
  * 驼峰命名
* Modifier (后缀、修饰)
  * 使用 "--" 连接
* State
  * 使用 "is-" 前缀

## SUIT struct

* @Component
* @Descendent
* @Modifier
* State

```css
/* before */
@component-namespace mine {

  @component SearchForm {
    padding: 0;
    margin: 0;

    @modifier advanced {
      padding: 1rem;
    }

    @descendent textField {
      border: 1px solid #ccc;

      /* This creates a state for the textField descendant */
      @when invalid {
        border: 1px solid red;
      }
    }
  }
}
/* after */
.mine-SearchForm {
  padding: 0;
  margin: 0;
}

.mine-SearchForm--advanced {
  padding: 1rem;
}

.mine-SearchForm-textField {
  border: 1px solid #ccc;
}

.mine-SearchForm-textField.is-invalid {
  border: 1px solid red;
}
```

### Utils

Ex.

```
@utility clearFix {
  &:before, &:after {
    content: "";
    display: table;
  }
  &:after {
    clear: both;
  }
  /* If supporting IE 6/7 */
  *zoom: 1;
}
```

* [utils-layout](https://github.com/suitcss/utils-layout)
  * u-cf - Contain floats (micro clearfix).
  * u-nbfc - Create a new block formatting context.
  * u-nbfcAlt - Create a new block formatting context (alternative technique).
  * u-floatLeft - Float left.
  * u-floatRight - Float right.
* [utils-display](https://github.com/suitcss/utils-display)
  * u-block - Display block.
  * u-hidden - Display none.
  * u-hiddenVisually - Visually hidden but available to screenreaders.
  * u-inline - Display inline.
  * u-inlineBlock - Display inline-block.
  * u-table - Display table.
  * u-tableCell - Display table-cell.
  * u-tableRow - Display table-row.
* [utils-position](https://github.com/suitcss/utils-position)
  * u-posAbsolute - Absolutely position an element.
  * u-posAbsoluteCenter - Absolutely position and centre an element.
  * u-posFit - Fit an element to the dimensions of its parent
  * u-posFullScreen - Fixes an element over the viewport
  * u-posFixed - Fixed position an element.
  * u-posFixedCenter - Fix an element in the centre of the viewport
  * u-posRelative - Relatively position an element.
  * u-posStatic - Static position an element.
* [utils-link](https://github.com/suitcss/utils-link)
  * u-linkBlock - Block-level link with no text-decoration for any state.
  * u-linkClean - A link without no text-decoration for any state.
  * u-linkComplex - Limit a link's interactive text-decoration underline to a sub-section of the link text.


* [utils-offset](https://github.com/suitcss/utils-offset)
  * --sm-viewport
    * ex. ```@custom-media --sm-viewport (min-width:320px) and (max-width:640px);```
  * --md-viewport
    * ex. ```@custom-media --md-viewport (min-width:640px) and (max-width:960px);```
  * --lg-viewport
    * ex. ```@custom-media --lg-viewport (min-width:960px);```
* [utils-before](https://github.com/suitcss/utils-before)
  * u-sm-beforeXofY - To use at the small Media Query breakpoint.
  * u-md-beforeXofY - To use at the medium Media Query breakpoint.
  * u-lg-beforeXofY - To use at the large Media Query breakpoint.
* [utils-after](https://github.com/suitcss/utils-after)
  * u-sm-afterXofY - To use at the smallest Media Query breakpoint.
  * u-md-afterXofY - To use at the medium Media Query breakpoint.
  * u-lg-afterXofY - To use at the large Media Query breakpoint.
* [utils-size](https://github.com/suitcss/utils-size)
  * u-sizeFull - Make an element the width of its parent.
  * u-sizeFill - Make an element fill the remaining space. Distribute space evenly on multiple elements.
  * u-sizeFillAlt - An alternative method to make an element fill the remaining space. Distribute space based on element width.
    * u-sm-sizeXofY - To use at the smallest Media Query breakpoint.
    * u-md-sizeXofY - To use at the medium Media Query breakpoint.
    * u-lg-sizeXofY - To use at the largest Media Query breakpoint.


* [utils-text](https://github.com/suitcss/utils-text)
  * u-textBreak - Break strings when their length exceeds the width of their container.
  * u-textCenter - Center-align text.
  * u-textLeft - Left-align text.
  * u-textRight - Right-align text.
  * u-textInheritColor - Inherit the ancestor's text color.
  * u-textKern - Enable kerning in supporting browsers.
  * u-textNoWrap - Prevent wrapping at whitespace.
  * u-textTruncate - Truncate a single line of text, with ellipsis.
* [utils-align](https://github.com/suitcss/utils-align)
  * u-alignBaseline -Vertically align to baseline.
  * u-alignBottom - Vertically align to bottom.
  * u-alignMiddle - Vertically align to middle.
  * u-alignTop - Vertically align to top.
* [utils-state](https://github.com/suitcss/utils-state)
  * u-isActionable - Style with a pointer cursor to indicate an element will trigger an action.
  * u-isDisabled - Style with a default cursor to indicate no associated action.
  * u-isDraggable - Style with a move cursor to indicate an element can be dragged.
  * u-isHidden - Completely remove an element from the flow and screen readers.
  * u-isHiddenVisually - Completely remove an element from the flow but leave available to screen readers.
  * u-isInvisible - Hide an element without affecting flow
  * u-isShown - Show a hidden element.
  * u-isVisible - Make an element visible.


* [utils-flex](https://github.com/suitcss/utils-flex)

### Components

* [components-grid](https://github.com/suitcss/components-grid)
* [components-arrange](https://github.com/suitcss/components-arrange)
* [components-button-group](https://github.com/suitcss/components-button-group)
* [components-button](https://github.com/suitcss/components-button)
* [components-flex-embed](https://github.com/suitcss/components-flex-embed)
