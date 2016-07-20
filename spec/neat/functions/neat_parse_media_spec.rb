require "spec_helper"

describe "neat-parse-media" do
  before(:all) do
    ParserSupport.parse_file("functions/neat-parse-media")
  end

  context "called with number" do
    it "gets min-width wraped number" do
      rule = 'content: "only screen and (min-width: 100px)"'

      expect(".neat-parse-media-number").to have_rule(rule)
    end
  end

  context "called with string" do
    it "gets the string" do
      rule = 'content: "only screen and (max-width: 25rem)"'

      expect(".neat-parse-media-string").to have_rule(rule)
    end
  end
end
