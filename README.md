Muller-Brockmann a framework for Bourbon
================

Muller-Brockmann is an open source fluid grid framework on top of [http://thoughtbot.com/bourbon](Bourbon). It's goal is to be decisive and simple enough for developers to use to easily get a layout set and flexible enough for designers to come in and change it. The grid and typography are built using ems and percentages based off of the golden ratio so that it can easily scale and visually appealing. 

Muller-Brockmann uses all mixins for its grid to encourage semantic and meaningful classes.

Why is Muller-Brockmann not fully responsive?
===
We believe that a fully responsive framework would depend on Sass 3.2 

Using the grid
===
Site container:
` @include outer-container; `

Column span:
` @include span-column(columns, container, display type(table, inline-block, block)) `

Element that spans across 8 columns:
` @include span-column(8) `

If the element's parent isn't the 12 columns, give the parents span to keep the right proportions:
` @include span-column(2, 8) `

To use a table-cell layout add "table" as the
` @include span-column(2, 8, table) `

To use inline-block in the layout add "inline-block" as the
` @include span-column(2, 8, inline-table) `

Clearing the row:
` @include row(display type); `

Pre, post & pad
===

To remove space before or after the column, use pre:
` @extend pre(2); `

To remove space before or after the column, use post:
` @extend post(2); `

To remove space before or after the column, use post:
` @extend pad; `
