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

task :watch do
  puts "Starting to watch source with Jekyll and Sass..."

  system "sass --update _sass:css -f -l"
  jekyllPid = Process.spawn("jekyll build --watch")
  guardPid = Process.spawn("guard")

  trap("INT") {
    [jekyllPid, guardPid].each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
    exit 0
  }

  [jekyllPid, guardPid].each { |pid| Process.wait(pid) }
end

task :bump do
  `git fetch && git checkout --merge origin/master app/assets/stylesheets lib/neat/version.rb`
end
