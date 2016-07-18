require "spec_helper"

describe "neat-column-default" do
  before(:all) do
    ParserSupport.parse_file("functions/neat-column-default")
  end

  context "called with default grid" do
    it "gets default columns" do
      rule = "content: 12"

      expect(".neat-column-default-grid").to have_rule(rule)
    end

    it "gets custom columns" do
      rule = "content: 10"

      expect(".neat-column-default-grid-custom-col").to have_rule(rule)
    end
  end

  context "called with custom grid" do
    it "gets default columns" do
      rule = "content: 18"

      expect(".neat-column-custom-grid").to have_rule(rule)
    end

    it "gets custom columns" do
      rule = "content: 10"

      expect(".neat-column-custom-grid-custom-col").to have_rule(rule)
    end
  end
end
