require "fileutils"

module Neat
  class Generator
    def initialize(arguments)
      @subcommand = arguments.first
    end

    def run
      if @subcommand == "install"
       install
      elsif @subcommand == "update"
        update
      elsif @subcommand == "remove"
        remove
      end
    end

    def update
      if neat_files_already_exist?
        remove_neat_directory
        install_files
        puts "Neat files updated."
      else
        puts "No existing neat installation. Doing nothing."
      end
    end

    def install
      if neat_files_already_exist?
        puts "Neat files already installed, doing nothing."
      else
        install_files
        puts "Neat files installed to neat/"
      end
    end

    def remove
      if neat_files_already_exist?
        remove_neat_directory
        puts "Neat was successfully removed."
      else
        puts "No existing neat installation. Doing nothing."
      end
    end

    private

    def neat_files_already_exist?
      File.directory?("neat")
    end

    def install_files
      FileUtils.mkdir_p("neat")
      FileUtils.cp_r(all_stylesheets, "neat/")
    end

    def remove_neat_directory
      FileUtils.rm_rf("neat")
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "app", "assets", "stylesheets")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
