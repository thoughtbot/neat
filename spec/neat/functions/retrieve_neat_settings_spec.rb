require "spec_helper"

describe "retrieve-neat-settings" do
  before(:all) do
    ParserSupport.parse_file("functions/retrieve-neat-settings")
  end

  context "called with default settings" do
    it "gets default columns" do
      rule = "content: 12"

      expect(".neat-settings-default-columns").to have_rule(rule)
    end

    it "gets default gutter" do
      rule = "content: 20px"

      expect(".neat-settings-default-gutter").to have_rule(rule)
    end
  end

  context "called with custom settings" do
    it "gets default columns" do
      rule = "content: 18"

      expect(".neat-settings-eighteen-columns").to have_rule(rule)
    end

    it "gets default gutter" do
      rule = "content: 33px"

      expect(".neat-settings-eighteen-gutter").to have_rule(rule)
    end
  end
end
