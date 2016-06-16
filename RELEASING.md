# Releasing

1. Update the version number in these places:
  - `lib/neat/version.rb`
  - `core/neat/_neat.scss`
  - `package.json`
  - `bower.json`

1. Update `NEWS.md`

1. Commit changes. Use the convention “Neat vX.X.X” in your commit message.
   There shouldn’t be code changes, and thus CI doesn’t need to run.

1. Run `bundle exec rake release`, which tags the release, pushes the tag to GitHub, and
   pushes the gem to RubyGems.org.

1. Run `npm publish`, which pushes the new version to npm’s registry (if
   releasing a pre-release, run `npm publish --tag beta`).

1. Add a [new GitHub release](//github.com/thoughtbot/neat/releases/new).

1. Re-generate and publish
   the [documentation website](//github.com/thoughtbot/neat-docs),
   using the available Gulp tasks.

1. Announce the new release, making sure to say “thank you” to the contributors
   who helped shape this version!
