require "spec_helper"

describe "grid-shift" do
  before(:all) do
    ParserSupport.parse_file("mixins/grid-shift")
  end

  context "called with default settings" do
    it "adds relative positioning without moving the object" do
      rule = "left: auto; position: relative;"

      expect(".grid-shift-default").to have_ruleset(rule)
    end

    it "moves the object one column to the right" do
      rule = "left: calc(8.33333% - 21.66667px + 20px); position: relative;"

      expect(".grid-shift-1-default").to have_ruleset(rule)
    end

    it "moves the object six columns to the right" do
      rule = "left: calc(50% - 30px + 20px); position: relative;"

      expect(".grid-shift-6-default").to have_ruleset(rule)
    end

    it "moves the object six columns to the left" do
      rule = "left: calc(-50% - 10px + 20px); position: relative;"

      expect(".grid-shift-neg-6-default").to have_ruleset(rule)
    end
  end

  context "called with custom settings" do
    it "adds relative positioning without moving the object" do
      rule = "left: auto; position: relative;"

      expect(".grid-shift-0-six").to have_ruleset(rule)
    end

    it "moves the object one column to the right" do
      rule = "left: calc(16.66667% - 2.33333rem + 2rem); position: relative;"

      expect(".grid-shift-1-six").to have_ruleset(rule)
    end

    it "moves the object three columns to the right" do
      rule = "left: calc(50% - 3rem + 2rem); position: relative;"

      expect(".grid-shift-3-six").to have_ruleset(rule)
    end

    it "moves the object three columns to the left" do
      rule = "left: calc(-50% - 1rem + 2rem); position: relative;"

      expect(".grid-shift-neg-3-six").to have_ruleset(rule)
    end
  end
end
