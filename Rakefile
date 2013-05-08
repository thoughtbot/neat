require 'rubygems'
require 'bundler'
require 'rake'
require './lib/neat/version.rb'

import "lib/tasks/docset.rake"

desc "Generate Jekyll site"
task :generate do
  puts "Generating site with Jekyll..."
  `sass --update _sass:css -f --style compressed`
  `jekyll build`
end

task :default => [:watch]

desc "Watch the site and regenerate when it changes"
task :watch do
  puts "Starting to watch source with Jekyll and Sass..."

  system "sass --update _sass:css -f -l"
  jekyllPid = Process.spawn("jekyll serve --watch")
  sassPid = Process.spawn("sass --watch _sass:css -l")

  trap("INT") {
    [jekyllPid, sassPid].each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
    exit 0
  }

  [jekyllPid, sassPid].each { |pid| Process.wait(pid) }
end

task :bump do
  `git checkout --merge master app/assets/stylesheets lib/neat/version.rb`
end
