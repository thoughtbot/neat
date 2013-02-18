$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'neat'
require 'aruba/api'
require 'css_parser'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include BourbonSupport
  config.include SassSupport
  config.include CssParser
  config.include ParserSupport
  config.include Aruba::Api

  config.before(:all) do
    install_bourbon_files
    generate_css
  end

  config.after(:all) do
    remove_bourbon_files
    clean_up
  end
end
