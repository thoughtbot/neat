[![Bourbon Neat](http://neat.bourbon.io/images/logotype.svg)](http://thoughtbot.com/neat)

Homepage of Bourbon Neat.

Local Development
===
1. Run `bundle install` to install dependencies.
2. Run `guard`.
3. Visit `http://localhost:4000/`.
4. Optional: Use the [Livereload](http://livereload.com) browser extension for automatic reloading of the page.
5. When done, type `exit` in the guard console.

Updating Neat
===

In order to use the latest version of Neat, run `rake bump`. You will have to
commit after running this command.

Updating Bourbon
===

Bourbon is installed in a local folder. To update it:
1. Run `gem update bourbon`.
2. Change to the `_sass` directory: `cd _sass`
3. Run `bourbon update`.
4. Commit the changes.

License
===

Bourbon Neat is Copyright © 2012-2014 thoughtbot. It is free software, and may be redistributed under the terms specified in the LICENSE file.
