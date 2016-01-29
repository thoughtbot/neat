[![Neat](http://images.thoughtbot.com/bourbon/neat-logo.svg)](http://neat.bourbon.io)

[![Gem Version](http://img.shields.io/gem/v/neat.svg?style=flat)](https://rubygems.org/gems/neat) [![Travis](http://img.shields.io/travis/thoughtbot/neat.svg?style=flat)](https://travis-ci.org/thoughtbot/neat)
[![Gitter](http://img.shields.io/badge/gitter-neat-ae3dd2.svg?style=flat)](https://gitter.im/thoughtbot/neat)
[![Stack Overflow](http://img.shields.io/badge/stack%20overflow-neat-ae3dd2.svg?style=flat)](http://stackoverflow.com/questions/tagged/neat)

## A lightweight grid framework

Neat is a fluid grid framework with the aim of being easy enough to use out of the box and flexible enough to customize down the road.

- **[Demo](http://neat.bourbon.io)**
- **[Documentation](http://thoughtbot.github.io/neat-docs/latest)**
- **[Changelog](https://github.com/thoughtbot/neat/releases)**
- **[Issues & Bugs](https://github.com/thoughtbot/neat/issues)**

Follow the [@bourbonsass](https://twitter.com/bourbonsass) Twitter account
for updates.

## Requirements

- [Sass](https://github.com/sass/sass) 3.3+
- :warning: If you need **Sass 3.2 support**, you should [use Neat 1.5.1](#installing-older-versions-of-neat)

## Installation

For command line help, visit our wiki page on Neat’s [command line interface](https://github.com/thoughtbot/neat/wiki/Command-Line-Interface).

1. Install the Neat gem using the [RubyGems](https://rubygems.org) package manager:

  ```bash
  gem install neat
  ```

  Alternatively, you can install Neat with [Bower](http://bower.io).

2. Install or update Neat’s dependencies:

  ```bash
  gem install sass # or gem update sass
  ```

3. Install the Neat library into the current directory:

  ```bash
  neat install
  ```

4. Import Neat in your stylesheet:

  ```scss
  @import "neat/neat";
  ```

  It’s not recommended to add or modify the Neat files so that you can update them easily.

## Installation for Ruby on Rails

1. Add Neat to your Gemfile:

  ```ruby
  gem "neat"
  ```

2. Then run:

  ```bash
  bundle install
  ```

  If you see the error `Bundler could not find compatible versions for gem "sass"`, run:

  ```bash
  bundle update sass
  ```

3.  Import Neat in your `application.scss`:

  ```scss
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

## Browser support

_Update…_


## The Bourbon family

- [Bourbon](https://github.com/thoughtbot/bourbon): A simple and lightweight mixin library for Sass
- [Neat](https://github.com/thoughtbot/neat): A lightweight semantic grid framework for Sass and Bourbon
- [Bitters](https://github.com/thoughtbot/bitters): Scaffold styles, variables and structure for Bourbon projects
- [Refills](https://github.com/thoughtbot/refills): Prepackaged patterns and components built with Bourbon, Neat and Bitters

Also check out [Proteus](https://github.com/thoughtbot/proteus), a collection of useful starter kits to help you prototype faster. Each kit comes with Bourbon, Neat and Bitters out-of-the-box.

## Contributing

See the [contributing] document. Thank you, [contributors]!

  [contributing]: CONTRIBUTING.md
  [contributors]: https://github.com/thoughtbot/bourbon/graphs/contributors

## License

Neat is copyright © 2011 [thoughtbot, inc.][thoughtbot] It is free software, and may be redistributed under the terms specified in the [license].

  [license]: LICENSE.md

## About

Bourbon is maintained by the thoughtbot design team. It is funded by [thoughtbot, inc.][thoughtbot] and the names and logos for thoughtbot are trademarks of thoughtbot, inc.

[<img src="http://thoughtbot.github.io/images/signature.svg" width="250" alt="thoughtbot logo">][thoughtbot]

We love open-source software! See [our other projects][community] or [hire us][hire] to design, develop, and grow your product.

  [thoughtbot]: https://thoughtbot.com?utm_source=github
  [community]: https://thoughtbot.com/community?utm_source=github
  [hire]: https://thoughtbot.com/hire-us?utm_source=github
