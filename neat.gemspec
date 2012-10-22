# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'neat/version'

Gem::Specification.new do |s|
  s.name        = "neat"
  s.version     = Neat::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kyle Fiedler", "Reda Lemeden", "Joel Oliveira"]
  s.email       = ["support@thoughtbot.com"]
  s.homepage    = "https://github.com/thoughtbot/neat"
  s.summary     = "A fluid grid framework on top of Bourbon"
  s.description = <<-DESC
Neat is an open source grid framework built on top of Bourbon with the aim of being easy enough to use out of the box and flexible enough to customize down the road.
  DESC

  s.rubyforge_project = "neat"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('sass', '>= 3.2')
  s.add_dependency('bourbon', '>= 2.1')

  s.add_development_dependency('aruba', '~> 0.4')
  s.add_development_dependency('rake')
end
