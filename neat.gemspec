$:.push File.expand_path("../lib", __FILE__)
require "neat/version"

Gem::Specification.new do |s|
  s.add_development_dependency "aruba", "~> 0.5.0"
  s.add_development_dependency "css_parser"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "scss_lint", "~> 0.44"
  s.add_runtime_dependency "sass", "~> 3.4"
  s.add_runtime_dependency "thor", "~> 0.19"
  s.authors = [
    "Joel Oliveira",
    "Joshua Ogle",
    "Kyle Fiedler",
    "Reda Lemeden",
    "Tyson Gach",
    "Ward Penney",
    "Will McMahan"
  ]
  s.email         = "design+neat@thoughtbot.com"
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files         = `git ls-files`.split("\n")
  s.homepage      = "http://neat.bourbon.io"
  s.license       = "MIT"
  s.name          = "neat"
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ["lib"]
  s.summary       = "A lightweight Sass grid framework"
  s.version       = Neat::VERSION
end
