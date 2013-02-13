require "rubygems"
require "rake"

desc "Generate Jekyll site"
task :generate do
  puts "Generating site with Jekyll..."
  system "sass --update --style compressed _sass:css -f -r ./_sass/bourbon/lib/bourbon.rb"
  system "jekyll --no-auto --pygments"
end # task :generate

task :default => [:watch]

desc "Watch the site and regenerate when it changes"
task :watch do
  puts "Starting to watch source with Jekyll and Sass..."

  system "sass --update _sass:css -f -l -r ./_sass/bourbon/lib/bourbon.rb"
  jekyllPid = Process.spawn("jekyll --auto --server --pygments")
  sassPid = Process.spawn("sass --watch _sass:css -l -r ./_sass/bourbon/lib/bourbon.rb")
  system "open -a 'Google\ Chrome' 'http://localhost:4000'"

  trap("INT") {
    [jekyllPid, sassPid].each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
    exit 0
  }

  [jekyllPid, sassPid].each { |pid| Process.wait(pid) }
end # task :watch
