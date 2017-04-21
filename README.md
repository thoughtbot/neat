[<img src="http://images.thoughtbot.com/bourbon/neat-logo-v2.svg" width="200" alt="Neat logo">][Neat]

## A lightweight and flexible Sass grid

[Neat] is a fluid grid framework with the aim of being easy enough to
use out of the box and flexible enough to customize down the road.

  [Neat]: https://neat.bourbon.io/

### Helpful Links

- [Demos](https://neat.bourbon.io/examples/)
- [Documentation](https://neat.bourbon.io/docs/latest/)
- [Change log](CHANGELOG.md)
- [Twitter](https://twitter.com/bourbonsass)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/neat)
- [Neat 2.0 Building the future of floated Sass grids](https://robots.thoughtbot.com/building-the-future-of-floated-css-grids) by [@whmii](http://social.mcmahan.me)
- [Getting started with Neat 2.0, a lightweight and flexible Sass grid](https://robots.thoughtbot.com/the-release-of-neat-2-0-a-lightweight-and-flexible-sass-grid) by [@whmii](http://social.mcmahan.me)

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Command Line Interface](#command-line-interface)
- [The Bourbon Family](#the-bourbon-family)
- [Contributing](#contributing)
- [License](#license)
- [About](#about)

## Requirements

- [Sass] 3.4+ or [LibSass] 3.3+

  [Sass]: https://github.com/sass/sass
  [LibSass]: https://github.com/sass/libsass

## Installation

1. Install the Neat gem using the [RubyGems] package manager:

   ```bash
   gem install neat
   ```

    Alternatively, you can install Neat with [Bower].

1. Install or update Neat’s dependencies:

   ```bash
   gem install sass # or gem update sass
   ```

   **Pro Tip:** You can target installation into a specific directory using the
   `path` flag:

   ```bash
   neat install --path my/custom/path/
   ```

1. Install the Neat library into the current directory:

   ```bash
   neat install
   ```

1. Import Neat in your stylesheet:

   ```scss
   @import "neat/neat";
   ```

   It’s not recommended to add or modify the Neat files so that you can update
   them easily.

[RubyGems]: https://rubygems.org
[Bower]: http://bower.io

### Installation for Ruby on Rails 4.2+

1. Add Neat to your Gemfile:

   ```ruby
   gem "neat"
   ```

1. Then run:

   ```bash
   bundle install
   ```

   If you see the error `Bundler could not find compatible versions for gem
   "sass"`, run:

   ```bash
   bundle update sass
   ```

1. Import Neat in your `application.scss`:

   ```scss
   @import "neat";
   ```

   It should be noted that `@import` rules are not compatible with Sprockets
   directives. You need to use one or the other.

### Installing with npm and using a Node-based asset pipeline

1. Add Neat as a dependency:

   ```bash
   npm install --save bourbon-neat
   ```

1. If you’re using [eyeglass], skip to Step 3. Otherwise, you’ll need to add
   Neat to your node-sass `includePaths` option.
   `require("bourbon-neat").includePaths` is an array of directories that you
   should pass to node-sass. How you do this depends on how node-sass is
   integrated into your project.

1. Import Neat into your Sass files:

   ```scss
   @import "neat";
   ```

[eyeglass]: http://eyeglass.rocks

### Installing older versions of Neat

1. Uninstall any Neat gem versions you already have:

   ```bash
   gem uninstall neat
   ```

1. Reinstall the Neat gem, using the `-v` flag to specify the version you need:

   ```bash
   gem install neat -v 1.8.1
   ```

1. Follow the [instructions above](#installation) to install Neat into your
   project.

## Command Line Interface

```bash
neat [options]
```

### Options

| Option            | Description               |
| :---------------- | :------------------------ |
| `-h`, `--help`    | Show help                 |
| `-v`, `--version` | Show the version number   |
| `--path`          | Specify a custom path     |
| `--force`         | Force install (overwrite) |

### Commands

| Command        | Description                                        |
| :------------- | :------------------------------------------------- |
| `neat install` | Install Neat into the current directory            |
| `neat update`  | Overwrite and update Neat in the current directory |
| `neat remove`  | Removes Neat from the current directory            |
| `neat help`    | Show help                                          |
| `neat version` | Show the version number                            |

## The Bourbon family

- [Bourbon]: A lightweight Sass tool set
- [Bitters]: Scaffold styles, variables and structure for Bourbon projects
- [Refills]: Components and patterns built with Bourbon and Neat

  [Bourbon]: https://github.com/thoughtbot/bourbon
  [Bitters]: https://github.com/thoughtbot/bitters
  [Refills]: https://github.com/thoughtbot/refills

## Contributing

See the [contributing] document. Thank you, [contributors]!

  [contributing]: CONTRIBUTING.md
  [contributors]: https://github.com/thoughtbot/neat/graphs/contributors

## License

Neat is copyright © 2012 [thoughtbot, inc.][thoughtbot] It is free software, and
may be redistributed under the terms specified in the [license].

  [license]: LICENSE.md

## About

Neat is maintained by the thoughtbot design team. It is funded by
[thoughtbot, inc.][thoughtbot] and the names and logos for thoughtbot are
trademarks of thoughtbot, inc.

[<img src="http://presskit.thoughtbot.com/images/signature.svg" width="250" alt="thoughtbot logo">][thoughtbot]

We love open-source software! See [our other projects][community] or
[hire us][hire] to design, develop, and grow your product.

  [thoughtbot]: https://thoughtbot.com?utm_source=github
  [community]: https://thoughtbot.com/community?utm_source=github
  [hire]: https://thoughtbot.com/hire-us?utm_source=github
