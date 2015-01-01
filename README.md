[![Neat](http://images.thoughtbot.com/bourbon/neat-logo.svg)](http://neat.bourbon.io)

[![Gem Version](http://img.shields.io/gem/v/neat.svg?style=flat)](https://rubygems.org/gems/neat) [![Travis](http://img.shields.io/travis/thoughtbot/neat.svg?style=flat)](https://travis-ci.org/thoughtbot/neat)
[![Code Climate](http://img.shields.io/codeclimate/github/thoughtbot/neat.svg?style=flat)](https://codeclimate.com/github/thoughtbot/neat)
[![IRC](http://img.shields.io/badge/freenode-%23bourbon--neat-ae3dd2.svg?style=flat)](#)
[![Stack Overflow](http://img.shields.io/badge/stack%20overflow-neat-ae3dd2.svg?style=flat)](http://stackoverflow.com/questions/tagged/neat)

## A lightweight, semantic grid framework built with Bourbon

Neat is a fluid grid framework built with [Bourbon](https://github.com/thoughtbot/bourbon) with the aim of being easy enough to use out of the box and flexible enough to customize down the road.

- **[Demo](http://neat.bourbon.io)**
- **[Documentation](http://thoughtbot.github.io/neat-docs/latest)**
- **[Changelog](https://github.com/thoughtbot/neat/releases)**
- **[Issues & Bugs](https://github.com/thoughtbot/neat/issues)**
- **`#bourbon-neat`** on `irc.freenode.net`

## Requirements

- [Sass](https://github.com/sass/sass) 3.3+
- [Bourbon](https://github.com/thoughtbot/bourbon) 3.1+
- :warning: If you need **Sass 3.2 support**, you should [use Neat 1.5.1](#installing-older-versions-of-neat)

## Installation

Neat is distributed using the [RubyGems](https://rubygems.org) package manager, which allows you to easily generate a `neat` directory with all of the necessary files right into your project. Alternatively, you can install Neat with [Bower](http://bower.io).

For command line help, visit our wiki page on Neat’s [command line interface](https://github.com/thoughtbot/neat/wiki/Command-Line-Interface).

1. Install the Neat gem:

  ```bash
  gem install neat
  ```

2. Install or update Neat’s dependencies:

  ```bash
  gem install sass # or gem update sass
  ```
  ```bash
  gem install bourbon # or gem update bourbon
  ```

3. Install the Neat library into the current directory:

  ```bash
  bourbon install # if not already installed
  ```
  ```bash
  neat install
  ```

4. Import Neat in your stylesheet, after Bourbon:

  ```scss
  @import "bourbon/bourbon";
  @import "neat/neat";
  ```

  It’s not recommended to add or modify the Neat files so that you can update them easily.

## Installation for Ruby on Rails

1. Add Neat to your Gemfile:

  ```ruby
  gem 'neat'
  ```

2. Then run:

  ```bash
  bundle install
  ```

  If you see the error `Bundler could not find compatible versions for gem "sass"`, run:

  ```bash
  bundle update sass
  ```

3. Import Neat in your `application.css.scss`, after Bourbon:

  ```scss
  @import "bourbon";
  @import "neat";
  ```
  
  It should be noted that `@import` rules are not compatible with Sprockets directives. You need to use one or the other.

## Installing older versions of Neat

1. Uninstall any Neat gem versions you already have:

  ```bash
  gem uninstall neat
  ```

2. Reinstall the Neat gem, using the `-v` flag to specify the version you need:

  ```bash
  gem install neat -v 1.7.0
  ```

3. Follow the [instructions above](#installation) to install Neat into your project.

## Using Neat

First off, if you are planning to override the default grid settings (12 columns), it is recommended to create a `_grid-settings.scss` file for that purpose. Make sure to import it right *before* importing Neat:

```scss
@import "bourbon/bourbon"; // or "bourbon" when in Rails
@import "grid-settings";
@import "neat/neat"; // or "neat" when in Rails
```

In your newly created  `_grid-settings.scss`, import `neat-helpers` if you are planning to use `new-breakpoint()`, then define your new variables:

```scss
@import "neat/neat-helpers"; // or "neat-helpers" when in Rails

// Change the grid settings
$column: 90px;
$gutter: 30px;
$grid-columns: 10;
$max-width: em(1088);

// Define your breakpoints
$tablet: new-breakpoint(max-width 768px 8);
$mobile: new-breakpoint(max-width 480px 4);
```

See the [docs](http://thoughtbot.github.io/neat-docs/latest/#variable) for a full list of settings.

Next, include the `outer-container` mixin in the topmost container (to which the `max-width` setting will be applied):

```scss
div.container {
  @include outer-container;
}
```

Then use `span-columns` on any element to specify the number of columns it should span:

```scss
div.element {
  @include span-columns(6);
}
```

If the element’s parent isn’t the top-most container, you need to add the number of columns of the parent element to keep the right proportions:

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

To make your layout responsive, use the `media()` mixin to modify both the grid and the layout:

```scss
.my-class {
  @include media($mobile) { // As defined in _grid-settings.scss
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

By setting `$visual-grid` to `true`, you can display the base grid in the background (default) or as an overlay. You can even change the color and opacity of the grid-lines by overriding the default settings as detailed in the section below.

The visual grid reflects the changes applied to the grid via the `new-breakpoint()` mixin, as long as the media contexts are defined *before* importing Neat.

## FAQ

#### How do I use `omega()` in a mobile-first workflow?

Using `omega()` with an `nth-child` pseudo selector in a mobile-first workflow will cause the style to be applied to wider-viewport media queries as well. That is the cascading nature of CSS.

One solution would be to provide an `omega-reset()` mixin that negates the effect of `omega()` on that specific `nth-child` pseudo selector. While this is often the most suggested solution, it is also a lazy hack that outputs ugly code and can quickly get out of hand in complex layouts. As a general rule, having to *undo* CSS styles is a sign of poor stylesheet architecture (more about [CSS code smells](http://csswizardry.com/2012/11/code-smells-in-css/)).

The other, more elegant, solution is to use mutually exclusive media queries, also referred to as [media-query
splitting](http://simurai.com/blog/2012/08/29/media-query-splitting). This would guarantee that `omega()` styles are only applied where desired.

```scss
$first-breakpoint-value: 400px;
$second-breakpoint-value: 700px;
$medium-viewport: new-breakpoint(min-width em($first-breakpoint-value) max-width em($second-breakpoint-value));
$large-viewport: new-breakpoint(min-width em($second-breakpoint-value + 1));

.element {
  @include media($medium-viewport) {
    @include span-columns(6);
    @include omega(2n);
  }

  @include media($large-viewport) {
    @include span-columns(4);
    @include omega(3n);
  }
}
```

If, for some reason, you still think that `omega-reset` is the only way you want to go, check out Josh Fry’s [omega-reset](http://joshfry.me/blog/2013/05/13/omega-reset-for-bourbon-neat).

#### Why are the elements not properly aligned with the visual grid?

The visual grid is built using CSS gradients whose stops might contain decimal values depending on the default settings of your grid. In order to render the gradient, browsers round the pixel values since they can’t deal with pixel fractions.

As a result the viusal grid might be few pixels off in some browsers. The result is also inconsistent across browsers. For best results, preview your website on Firefox as it renders closest to the expected outcome.

At this point, writing an internal rounding mechanism is not high priority.

#### Framework X has this feature that Neat seems to be missing. Can you add it?

Unless you [open a pull request](https://github.com/thoughtbot/neat/compare/), the answer is most likely going to be no. Neat is lightweight and simple compared to other grid frameworks, and strives to remain so. We have plans for adding new features in future versions of the framework, but these will be most likely to support new ways of working with layouts on the Web, not patches to existing ones.

## Browser support

- Chrome 4.0+
- Firefox 3.5+
- Internet Explorer 9+ (visual grid is IE 10 only)
- Internet Explorer 8 with [selectivizr](http://selectivizr.com) (no `media()` support)
- Opera 9.5+
- Safari 4.0+

## The Bourbon family

- [Bourbon](https://github.com/thoughtbot/bourbon): A simple and lightweight mixin library for Sass
- [Neat](https://github.com/thoughtbot/neat): A lightweight semantic grid framework for Sass and Bourbon
- [Bitters](https://github.com/thoughtbot/bitters): Scaffold styles, variables and structure for Bourbon projects
- [Refills](https://github.com/thoughtbot/refills): Prepackaged patterns and components built with Bourbon, Neat and Bitters

## Credits

[![thoughtbot](http://images.thoughtbot.com/bourbon/thoughtbot-logo.svg)](http://thoughtbot.com)

Neat is maintained and funded by [thoughtbot, inc](http://thoughtbot.com). Tweet your questions or suggestions to [@bourbonsass](https://twitter.com/bourbonsass) and while you’re at it follow us too.

## License

Copyright © 2012–2014 [thoughtbot, inc](http://thoughtbot.com). Neat is free software, and may be redistributed under the terms specified in the [license](LICENSE.md).
