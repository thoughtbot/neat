We love pull requests. Here's a quick guide:

1. Fork the repo.
2. Make your changes in a topic branch.
3. Run `rake` to see if you changes are breaking any existing functionality.
3. Squash your commits into a single one (more on that [here](http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html)).
4. Rebase against `origin/master`, push to your fork and submit a pull request.

At this point you're waiting on us. We like to at least comment on, if not
accept, pull requests within three business days (and, typically, one business
day). We may suggest some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted:

* Fix a bug, refactor code or expand an existing feature.
* Write [RSpec](https://www.relishapp.com/rspec) tests for your new features.
* Use the right syntax and naming conventions.
* Update parts of the documentation that are affected by your contribution.

**Git Commit Messages**

* Capitalize your commit messages.
* Start your message with a verb.
* Use present tense.
* Refer to the issue/PR number in your squashed commit message.

**SCSS Style Guide**

* Two spaces, no tabs.
* Dashes instead of underscores or camel case: `span-columns` **not** `span_columns` or `spanColumns`
* Names should be descriptive and written in full-words: `$visual-grid-color` **not** `$color` or `$vslgrd-clr`
* Space between property and value: `width: 20px` **not** `width:20px`
* Declarations within a block should be ordered alphabetically.
* Blank lines between rules.
* No trailing whitespace. Blank lines should not have any space.
