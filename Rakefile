require 'rubygems'
require 'bundler'
require 'rake'
require './lib/neat/docset.rb'

desc "Generate Jekyll site"
task :generate do
  puts "Generating site with Jekyll..."
  system "sass --update --style compressed _sass:css -f"
  system "jekyll --no-auto --pygments"
end

task :default => [:watch]

desc "Watch the site and regenerate when it changes"
task :watch do
  puts "Starting to watch source with Jekyll and Sass..."

  system "sass --update _sass:css -f -l"
  jekyllPid = Process.spawn("jekyll --auto --server --pygments")
  sassPid = Process.spawn("sass --watch _sass:css -l")

  trap("INT") {
    [jekyllPid, sassPid].each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
    exit 0
  }

  [jekyllPid, sassPid].each { |pid| Process.wait(pid) }
end

desc "Generate minimized, production-ready CSS"
task :generate do
  `sass --update _sass:css -f --style compressed`
end

task :docset do
  `jekyll --no-server --no-auto`
  puts "Generating docset directories..."
  generate_docset_dirs
  puts "Copying docset assets..."
  copy_plist_file
  copy_docset_markup
  puts "Generating docset database..."
  generate_database
  puts "Generating feed..."
  generate_feed
  puts "Archiving package..."
  archive_package
  puts "Cleaning up..."
  delete_package_file
end

task :version do
  `git checkout --merge master lib/neat/version.rb`
end
