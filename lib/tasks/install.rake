require "fileutils"
require "find"

namespace :neat do
  desc "Copy Neat's files to the Rails assets directory."
  task :install, [:sass_path] do |t, args|
    args.with_defaults(:sass_path => 'public/stylesheets/sass')
    source_root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    FileUtils.mkdir_p("#{Rails.root}/#{args.sass_path}/neat")
    FileUtils.cp_r("#{source_root}/app/assets/stylesheets/.", "#{Rails.root}/#{args.sass_path}/neat", { :preserve => true })

    Find.find("#{Rails.root}/#{args.sass_path}/neat") do |path|
      if path.end_with?(".css.scss")
        path_without_css_extension = path.gsub(/\.css\.scss$/, ".scss")
        FileUtils.mv(path, path_without_css_extension)
      end
    end
  end
end
