require "css_parser"
require "fileutils"
include CssParser

Dir.glob("lib/tasks/tests/*.rake").each { |r| import r }

task :test do
  install_temporary_bourbon_folder
  generate_css_file
  parser = CssParser::Parser.new
  parser.load_file!('test/test.css')
  test_omega(parser)
  remove_temporary_bourbon_directory
end

def test(parser, test_code, selector, declaration, value)
  rules = parser.find_by_selector(selector)
  rules.each do |rule|
    rule_declaration, rule_value = rule.split(":")
    rule_value.gsub!(/;|^ /, "")
    if rule_declaration == declaration and rule_value == value
      puts "#{test_code} "+ pass('PASSED') +" "+ css(selector) +" has property "+ css(declaration + ": " + value + ";") +" "
      return
    end
  end
  puts "#{test_code} " + fail('FAILED') + " Expected "+ css(selector) +" with "+ css(declaration + ": " + value + ";") +" but got "+ css(rules[0]) +" instead."
end


def install_temporary_bourbon_folder
  system("bourbon install --path test")
end

def remove_temporary_bourbon_directory
  FileUtils.rm_rf("test/bourbon")
end

def generate_css_file
  system("sass test/test.scss:test/test.css")
end

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def fail(text)
  colorize(text, 31)
end

def pass(text)
  colorize(text, 32)
end

def css(text)
  colorize(text, 34)
end
