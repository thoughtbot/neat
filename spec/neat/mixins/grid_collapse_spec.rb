require "spec_helper"

describe "grid-collapse" do
  before(:all) do
    ParserSupport.parse_file("mixins/grid-collapse")
  end

  context "called with default settings" do
    it "adds margin for just the gutter with no specified column" do
      ruleset = "margin-left: -20px; " +
        "margin-right: -20px; " +
        "width: calc(100% + 40px);"
      expect(".grid-collapse-default").to have_ruleset(ruleset)
    end
  end

  context "called with custom settings" do
    it "adds margin for just the gutter with no specified column" do
      ruleset = "margin-left: -4rem; " +
        "margin-right: -4rem; " +
        "width: calc(100% + 8rem);"

      expect(".grid-collapse-custom").to have_ruleset(ruleset)
    end
  end
end
