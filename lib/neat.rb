require "neat/generator"

neat_path = File.expand_path("../../core", __FILE__)
ENV["SASS_PATH"] = [
  ENV["SASS_PATH"],
  neat_path,
].compact.join(File::PATH_SEPARATOR)
