[![Bourbon Neat](http://thoughtbot.com/neat/images/logotype.svg)](http://thoughtbot.com/neat)

**Neat** is an open source fluid grid framework built on top of [Bourbon](http://thoughtbot.com/bourbon) with the aim of being easy enough to use out of the box and flexible enough to customize down the road.

Learn more about Neat and why we built it [here](http://thoughtbot.com/neat/).

Getting started
===

Requirements:

- Sass 3.2+
- Bourbon 2.1+

<<<<<<< HEAD
Put the `/neat` folder in your Sass directory and import it right below Bourbon in your stylesheets:
=======

Gemfile contents:

    gem 'bourbon'
    gem 'neat'

After running `bundle install` you will be able to use bourbon and neat together. Within your application.css.scss file place the following:

    @import "bourbon";
    @import "neat";
>>>>>>> Preliminary README edits

```scss
@import "bourbon/bourbon";
@import "neat/neat";
```

Using the grid
===
The default grid uses 12 columns, a setting that can be easily overridden as detailed [further down](https://github.com/thoughtbot/neat#changing-the-defaults).

### Containers
Include the `outer-container` mixin in the topmost container (to which the `max-width` setting will be applied):

```scss
div.container {
  @include outer-container;
}
```

You can include this mixin in more than one element in the same page.

### Columns
Use the `span-columns` mixin to specify the number of columns an element should span:

```scss
@include span-columns($span: $columns of $container-columns, $display: block)
```

  * `columns` is the number of columns you wish this element to span.
  * `container-columns` (optional) is the number of columns the container spans, defaults to the total number of columns in the grid.
  * `display` (optional) changes the display type of the grid. Use `block`—the default—for floated layout, `table` for table-cell layout, and `inline-block` for an inline block layout.

eg. Element that spans across 6 columns (out of the default 12):

```scss
div.element {
  @include span-columns(6);
}
```

If the element's parent isn't the top-most container, you need to add the number of columns of the parent element to keep the right proportions:

```scss
div.container {
  @include outer-container;
  div.parent-element {
    @include span-columns(8);
    div.element {
      @include span-columns(6 of 8);
    }
  }
}
```

To use a table-cell layout, add `table` as the `display` argument:

```scss
@include span-columns(6 of 8, table)
```

Likewise for inline-block:

```scss
@include span-columns(6 of 8, inline-block)
```

The following syntaxes would also work:

```scss
@include span-columns(6 / 8,inline-block);
@include span-columns(6 8,inline-block);
```

### Rows
In order to clear floated or table-cell columns, use the `row` mixin:

```scss
@include row($display);
```

  * `display` takes either `block`—the default—or `table`.

### Shifting columns

To move an element to the left or right by a number of columns, use the `shift` mixin:

```scss
@include shift(2); // Move 2 columns to the right
@include shift(-3); // Move 3 columns to the left
```

Please note that the `shift()` mixin is incompatible with display `table`.

### Padding columns

To add padding around the entire column use `pad()`. By default it adds the same value as the grid's gutter but can take any unit value.

```scss
@include pad; // Adds a padding equivalent to the grid's gutter
@include pad(20px); // Adds a padding of 20px
```

The `pad()` mixin works particularly well with `span-columns(x, table)` by adding the necessary padding without breaking your table-based grid layout.

### Removing gutter

Neat automatically removes the last columns's gutter. However, if you are queueing more than one row of columns within the same parent element, you need to specify which columns are considered last in their row to preserve the layout. Use the `omega` mixin to achieve this:

```scss
@include omega; // Removes right gutter
```

You can also use `nth-omega` to remove the gutter of a specific column or set of columns:

```scss
@include nth-omega(nth-child);
```

  * `nth-child` takes any valid :nth-child value. See [https://developer.mozilla.org/en-US/docs/CSS/:nth-child](Mozilla's :nth-child documentation)

eg. Remove every 3rd gutter using:

```scss
@include nth-omega(3n);
```

### Filling parent elements

This makes sure that the child fills 100% of its parent:

```scss
@include fill-parent;
```

### Breakpoints

The `breakpoint()` mixin allows you to use media-queries to modify both the grid and the layout. It takes two arguments:

```scss
@include breakpoint($query:$feature $value, $total-columns: $grid-columns)
```

* `query` contains the media feature (min-width, max-width, etc.) and the value (481px, 30em, etc.). If you specify the value only, `min-width` will be used by default (ideal if you follow a mobile-first approach). You can also change the default feature in the settings (see section below).
* `total-columns` (optional) is the total number of columns to be used inside this media query. Changing the total number of columns will change the width, padding and margin percentages obtained using the `span-column` mixin.

##### Example 1

```scss
.my-class {
  @include breakpoint(481px) {
    font-size: 1.2em;
  }
}

// Compiled CSS

@media screen and (min-width: 481px) {
  .my-class {
    font-size: 1.2em;
  }
}
```

##### Example 2

```scss
.my-class {
  @include breakpoint(max-width 769px) {
    float: none;
  }
}

// Compiled CSS

@media screen and (max-width: 769px) {
  .my-class {
    float: none;
  }
}
```

##### Example 3

```scss
.my-class {
  @include breakpoint(max-width 769px) {
    @include span-columns(6);
  }
}

// Compiled CSS

@media screen and (max-width: 769px) {
  .my-class {
    display: block;
    float: left;
    margin-right: 2.35765%;
    width: 48.82117%; // That's 6 columns of the total 12
  }

  .my-class:last-child {
    margin-right: 0;
  }
}
```

##### Example 4

```scss
.my-class {
  @include breakpoint(max-width 769px, 6) { // Use a 6 column grid (instead of the default 12)
    @include span-columns(6);
  }
}

// Compiled CSS

@media screen and (max-width: 769px) {
  .my-class {
    display: block;
    float: left;
    margin-right: 4.82916%;
    width: 100%; // That's 6 columns of the total 6 specified for this media query
  }
  .my-class:last-child {
    margin-right: 0;
  }
}
```

##### Example 5

```scss
.my-class {
  @include breakpoint(min-width 320px max-width 480px) {
    font-size: 1.2em;
  }
}

// Compiled CSS

@media screen and (min-width: 320px) and (max-width: 480px) {
  .my-class {
    font-size: 1.2em;
  }
}
```

You can also use two ```@media``` features at the same time.

Here is a summary of possible argument combinations:

```scss
// YAY
@include breakpoint(480px);
@include breakpoint(max-width 480px);
@include breakpoint(min-width 320px max-width 480px);
@include breakpoint(480px, 4);
@include breakpoint(max-width 480px, 4);
@include breakpoint(min-width 320px max-width 480px, 4);
@include breakpoint(max-width 480px 4); // Shorthand syntax
@include breakpoint(min-width 320px max-width 480px 4); // Shorthand syntax

// NAY
@include breakpoint(480px 4);
@include breakpoint(max-width 4);
@include breakpoint(max-width, 4);
@include breakpoint(320px max-width 480px);
```

For convenience, you can create a new media context (breakpoint/column-count) with the help of the`new-breakpoint` mixin and use it throughout your code:

```scss
$mobile: new-breakpoint(max-width 480px 4); // Use a 4 column grid in mobile devices

.my-class {
  @include breakpoint($mobile) {
    @include span-columns(2);
  }
}

// Compiled CSS

@media screen and (max-width: 480px) {
  .my-class {
    display: block;
    float: left;
    margin-right: 7.42297%;
    width: 46.28851%; // 2 columns of the total 4 in this media context
  }
  .my-class:last-child {
    margin-right: 0;
  }
}
```

The `new-breakpoint` takes the same arguments as `breakpoint`.

### Visual grid

By setting `$visual-grid` to `true`, you can display the base grid in the background (default) or as an overlay. You can even change the color and opacity of the gridlines by overriding the default settings as detailed in the section below. Keep in mind that on Webkit, rounding errors in the fluid grid might result in the overlay being few pixels off.

The visual grid reflects the changes applied to the grid via the `new-breakpoint()` mixin.

### Changing the defaults

All the default settings can be overridden in your site-wide `_variables.scss`. Make sure to import this file *before* Neat (failing to do so will cause Neat to use the default values):

```scss
@import "bourbon/bourbon";
@import "variables";
@import "neat/neat";
```

Here is the list of the available settings:

#### Grid settings

- `$column`: The width of a single column in `px` or `em`.
- `$gutter`: Space between each two columns in `px` or `em`.
- `$grid-columns`: Total number of columns in the base grid. Defaults to 12.
- `$max-width`: The maximum width of the outer container in `px` or `em`.

#### Visual grid settings

- `$visual-grid`: Show the base grid. Defaults to `false`.
- `$visual-grid-color`: Visual grid color. Defaults to `#EEEEEE`.
- `$visual-grid-index`: If set to `front`, the grid is overlaid on the content.
- `$visual-grid-opacity`: Visual grid opacity.

#### Other settings

- `$border-box-sizing`: Makes all elements have a `border-box` layout. Defaults to `true`.
- `$default-feature`: Default `@media` feature for the `breakpoint()` mixin. Defaults to `min-width`.

### Browser support
- Firefox 3.5+
- Safari 4.0+
- Chrome 4.0+
- Opera 9.5+
- IE 9+ (Visual grid is IE10 only)
- IE 8 with [selectivizr](http://selectivizr.com) (no `breakpoint()` support)

Credits
===

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Bourbon is maintained and funded by [thoughtbot, inc](http://thoughtbot.com/community). Tweet your questions or suggestions at [@kaishin](https://twitter.com/kaishin) and [@kylefiedler](https://twitter.com/kylefiedler).

License
===

Bourbon Neat is Copyright © 2012 thoughtbot. It is free software, and may be redistributed under the terms specified in the LICENSE file.

