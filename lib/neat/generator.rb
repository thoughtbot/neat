require "neat/version"
require "fileutils"
require "thor"

module Neat
  class Generator < Thor
    map ["-v", "--version"] => :version

    desc "install", "Install Neat into your project"
    method_options path: :string, force: :boolean
    def install
      if neat_files_already_exist? && !options[:force]
        puts "Neat files already installed, doing nothing."
      else
        install_files
        puts "Neat files installed to #{install_path}/"
      end
    end

    desc "update", "Update Neat"
    method_options path: :string
    def update
      if neat_files_already_exist?
        remove_neat_directory
        install_files
        puts "Neat files updated."
      else
        puts "No existing neat installation. Doing nothing."
      end
    end

    desc "remove", "Remove Neat"
    method_options path: :string
    def remove
      if neat_files_already_exist?
        remove_neat_directory
        puts "Neat was successfully removed."
      else
        puts "No existing neat installation. Doing nothing."
      end
    end

    desc "version", "Show Neat version"
    def version
      say "Neat #{Neat::VERSION}"
    end

    private

    def neat_files_already_exist?
      install_path.exist?
    end

    def install_path
      @install_path ||= if options[:path]
          Pathname.new(File.join(options[:path], "neat"))
        else
          Pathname.new("neat")
        end
    end

    def remove_neat_directory
      FileUtils.rm_rf(install_path)
    end

    def install_files
      make_install_directory
      copy_in_scss_files
    end

    def make_install_directory
      FileUtils.mkdir_p(install_path)
    end

    def copy_in_scss_files
      FileUtils.cp_r(all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "core")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
