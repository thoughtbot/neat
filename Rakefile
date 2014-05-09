require 'rubygems'
require 'bundler'
require 'rake'
require './lib/neat/version.rb'

import "lib/tasks/docset.rake"

task :default => [:bump]

task :generate do
  puts "Generating site with Jekyll..."
  `sass --update _sass:css -f --style compressed`
  `jekyll build`
end

task :bump do
  `git fetch && git checkout --merge origin/master app/assets/stylesheets lib/neat/version.rb`
end
