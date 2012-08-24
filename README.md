**Neat** is an open source fluid grid framework built on top of [Bourbon](http://thoughtbot.com/bourbon) with the aim of being easy enough to use out of the box and flexible enough to customize down the road.

Learn more about Neat and why we built it [here](http://thoughtbot.com/neat/).


Getting started
===

Requirements:

- Sass 3.1+
- Bourbon 2.1+

Put the ```/neat``` folder in your Sass directory and import it right below Bourbon in your stylesheets:

    @import "bourbon/bourbon";
    @import "neat/neat";


Using the grid
===
The default grid uses 12 columns (a setting that can be easily overridden as detailed further down).

### Containers
Include the ```outer-container``` mixin in the topmost container (to which the ```max-width``` setting will be applied):

      div.container {
        @include outer-container;
      }


You can include this mixin in more than one element in the same page.

### Columns
Use the ```span-columns``` mixin to specify the number of columns an element should span: 

    @include span-columns($span: $columns of $container-columns, $display: block) 

  * ```columns``` is the number of columns you wish this element to span.
  * ```container-columns``` (optional) is the number of columns the container spans, defaults to the total number of columns in the grid.
  * ```display``` (optional) changes the display type of the grid. Use ```block```—the default—for floated layout, ```table``` for table-cell layout, and ```inline-block``` for an inline block layout.

eg. Element that spans across 6 columns (out of the default 12):

    div.element {
        @include span-columns(6);
    }


If the element's parent isn't the top-most container, you need to add the number of columns of the parent element to keep the right proportions:

    div.container {
      @include outer-container;

      div.parent-element {
        @include span-columns(8);

        div.element {
          @include span-columns(6 of 8);
        }
      }
    }

To use a table-cell layout, add ```table``` as the ```display``` argument:

    @include span-columns(6 of 8, table)


  Likewise for inline-block:

    @include span-columns(6 of 8, inline-block)

  The following syntaxes would also work:
    
    @include span-columns(6 / 8,inline-block);
    @include span-columns(6 8,inline-block);


### Rows
  In order to clear floated or table-cell columns, use the ```row``` mixin:

    @include row($display);

  * ```display``` takes either ```block```—the default—or ```table```.


### Shifting columns


  To move an element to the left or right by a number of columns, use the ```shift``` mixin:

    @include shift(2); // Move 2 columns to the right
    @include shift(-3); // Move 3 columns to the left

  Please note that the ```shift()``` mixin is incompatible with display ```table```.


### Padding columns

  To add padding around the entire column use ```pad()```. By default it adds the same value as the grid's gutter but can take any unit value.

    @include pad; // Adds a padding equivalent to the grid's gutter
    @extend pad(20px); // Adds a padding of 20px

  The ```pad()``` mixin works particularly well with ```span-columns(x, y, table)``` by adding the necessary padding without breaking your table-based grid layout.

### Removing gutter

  Neat automatically removes the last columns's gutter. However, if you are queueing more than one row of columns within the same parent element, you need to specify which columns are considered last in their row to preserve the layout. Use the ```omega``` mixin to achieve this:

    @include omega; // Removes right gutter

  You can also use ```nth-omega``` to remove the gutter of a specific column or set of columns:

    @include nth-omega(nth-child);

  * ```nth-child``` takes any valid :nth-child value. See [https://developer.mozilla.org/en-US/docs/CSS/:nth-child](Mozilla's :nth-child documentation)

  eg. Remove every 3rd gutter using:

    @include nth-omega(3n);

### Filling parent elements

  This makes sure that the child fills 100% of its parent:

      @include fill-parent;


### Changing the defaults

  All the default settings can be overridden, including ```$grid-columns``` and ```$max-width```. The complete list of settings can be found in the ```/settings``` subfolder. In order to override any of these settings, redefine the variable in your site-wide ```_variables.scss``` and make sure to import it *before* Neat (failing to do so will cause Neat to use the default values):

    @import "bourbon/bourbon";
    @import "variables";
    @import "neat/neat";


Credits
===

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Bourbon is maintained and funded by [thoughtbot, inc](http://thoughtbot.com/community). Tweet your questions or suggestions at [Kyle](https://twitter.com/kylefiedler) / [Reda](https://twitter.com/kaishin).

License
===

Bourbon Neat is Copyright © 2012 thoughtbot. It is free software, and may be redistributed under the terms specified in the LICENSE file.


