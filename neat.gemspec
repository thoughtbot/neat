# coding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'neat/version'

Gem::Specification.new do |s|
  s.name        = 'neat'
  s.version     = Neat::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Joel Oliveira', 'Kyle Fiedler', 'Reda Lemeden']
  s.email       = 'design+bourbon@thoughtbot.com'
  s.homepage    = 'http://neat.bourbon.io'
  s.summary     = 'A lightweight, semantic grid framework'
  s.license     = 'MIT'
  s.description = <<-DESC
Neat is a fluid grid framework built with the aim of being easy enough to use
out of the box and flexible enough to customize down the road.
  DESC

  s.rubyforge_project = 'neat'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency('sass', '>= 3.3')
  s.add_dependency("thor", "~> 0.19")

  s.add_development_dependency("scss_lint", "~> 0.43")
  s.add_development_dependency('aruba', '~> 0.5.0')
  s.add_development_dependency('bundler')
  s.add_development_dependency('css_parser')
  s.add_development_dependency('rake')
  s.add_development_dependency('rb-fsevent', '~> 0.9.1')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('rspec')
end
