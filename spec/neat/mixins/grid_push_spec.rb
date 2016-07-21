require "spec_helper"

describe "grid-push" do
  before(:all) do
    ParserSupport.parse_file("mixins/grid-push")
  end

  context "called with default settings" do
    it "adds margin for just the gutter with no specified column" do
      rule = "margin-left: 20px"

      expect(".grid-push-default").to have_rule(rule)
    end

    it "adds margin for one column" do
      rule = "margin-left: calc(8.33333% - 21.66667px + 40px)"

      expect(".grid-push-1-default").to have_rule(rule)
    end

    it "adds margin for six columns" do
      rule = "margin-left: calc(50% - 30px + 40px)"

      expect(".grid-push-6-default").to have_rule(rule)
    end

    it "adds margin for negative six columns" do
      rule = "margin-left: calc(-50% - 10px + 40px)"

      expect(".grid-push-neg-6-default").to have_rule(rule)
    end
  end

  context "called with custom settings" do
    it "adds margin for just the gutter with no specified column" do
      rule = "margin-left: 2rem"

      expect(".grid-push-0-six").to have_rule(rule)
    end

    it "adds margin for one column" do
      rule = "margin-left: calc(16.66667% - 2.33333rem + 4rem)"

      expect(".grid-push-1-six").to have_rule(rule)
    end

    it "adds margin for three columns" do
      rule = "margin-left: calc(50% - 3rem + 4rem)"

      expect(".grid-push-3-six").to have_rule(rule)
    end

    it "adds margin for negative three columns" do
      rule = "margin-left: calc(-50% - 1rem + 4rem)"

      expect(".grid-push-neg-3-six").to have_rule(rule)
    end
  end
end
