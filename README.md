Neat, a framework for Bourbon
================

Neat is an open source fluid grid framework on top of [Bourbon](http://thoughtbot.com/bourbon). It's goal is to be decisive and simple enough for developers to use to easily get a layout set and flexible enough for designers to come in and change it. The grid and typography are built using ems and percentages based off of the golden ratio so that it can easily scale and visually appealing.

With Neat the intent is to keep your markup as clean as possible. Neat doesn't enforce using rows for its grid meaning you don't need to add extra wrapping `<div>`'s. Neat uses all Sass mixins for its grid to encourage semantic and meaningful class names.

##Why is Neat not fully responsive?
We believe that a fully responsive framework would depend on Sass 3.2 which is unreleased. We want Neat to only depend on a stable version on Sass so until Sass 3.2 is released we will sit in waiting.

Once 3.2 is released we will work our way to supporting breakpoints.

[View demo]()

Requirements
===
Sass 3.1+
Bourbon 2.1+

Installing Neat
===
To install Neat put the neat folder in your top level Sass directory and import Neat right below Bourbon:

```css
@import "bourbon/bourbon";
@import "neat/neat";
```

Using the grid
===
The Neat grid by default is a 12 column grid.

###Site wrapper
Site container:
```css
@include outer-container;
```

###Column span:
``` css
@include span-columns(columns, container, display type) 
```
* columns – the amount of columns you wish this element to span
* container – the number of columns the container spans, defaults to full width
* display type – change the way that you layout objects, use block, the default, for floated layout, table for table-cell layout, and inline-block for inline block layout

eg. Element that spans across 8 columns:
```css
@include span-columns(8)
```

If the element's parent isn't the 12 columns, give the parents span to keep the right proportions:
```css
@include span-columns(2, 8)
```

To use a table-cell layout add "table" as the
```css
@include span-columns(2, 8, table)
```

To use inline-block in the layout add "inline-block" as the
```css
 @include span-columns(2, 8, inline-table)
```

###Rows
Clearing floated or table-cell columns
```css
@include row(display type);
```

* display type – block, the default, and table

Pre, post & pad
===
###Pre
To add columns of space before the column, use pre:
```css
@extend pre(2);
```
Adds a two column span before the content

###Post
To add columns of space before the column, use pre.
```css
@extend post(2);
```
Adds a two column span after the content

###Pad
To add padding around the entire column use pad. By default it add the same vaule as the grid's gutter but can take any unit value.

```css
@extend pad;
@extend pad(20px);
```

Omega
===
By default, Neat removes the last elements gutter but that doens't cover every use case. Use omega to remove any other element's gutter on the last item in the row.

```css
@include omega;
```
Removes right gutter

```css
@include nth-omega(nth-child);
```
* nth-child – any valid :nth-child number. See [https://developer.mozilla.org/en-US/docs/CSS/:nth-child](Mozilla's :nth-child documetation)

Remove every 3rd gutter:
```css
@include nth-omega(3n);
```

Fill Parent
===
This makes sure that the child fills 100% of its parent:
```css
@include fill-parent;
```

Changing the grid
===

###Variables
All you need to do to override Neat is to change the variables from their defaults. So if you want to have Georgia as your body font all you need to do is set `$body-font-family: $geogia;` in your sites Scss.

For all other variables look to neat/_variables.scss
