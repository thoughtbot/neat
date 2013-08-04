require 'spec_helper'

describe "@include outer-container()" do
  before(:all) do
    ParserSupport.parse_file("outer-container")
    ParserSupport.parse_file("outer-container-fixed")
  end

  it "adds clearfix" do
    expect('.container-default:after').to have_rule('clear: both')
  end

  context "in a flex grid" do
    it "sets max-width" do
      expect('.container-default').to have_rule('max-width: 960px')
    end
  end

  context "in a fixed grid" do
    it "sets width" do
      expect('.container-fixed-default').to have_rule('width: 960px')
    end
  end
end
