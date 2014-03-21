require 'rubygems'
require 'bundler'
require 'rspec/core/rake_task'
Bundler::GemHelper.install_tasks

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :test do
  puts "Creating a Bourbon directory..."
  `bourbon install --path test`
  puts "Generating CSS..."
  `sass -I . --watch test:css/ --style expanded`
end

task :clean do
  puts "Deleting Bourbon directory..."
  `rm -rf test/bourbon`
  puts "Deleting generated CSS..."
  `rm -rf css/`
end
