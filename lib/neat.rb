require "neat/generator"
neat_path = File.expand_path("../../core", __FILE__)
ENV["SASS_PATH"] = File.join([ENV["SASS_PATH"], neat_path].compact)
