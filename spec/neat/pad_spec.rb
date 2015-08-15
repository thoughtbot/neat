require "spec_helper"

describe "@include pad()" do
  before(:all) do
    ParserSupport.parse_file("pad")
  end

  context "with no argument" do
    it "sets padding to gutter percentage" do
      expect(".pad-default").to have_rule("padding: 2.35765%")
    end
  end

  context "with argument (20px)" do
    it "sets padding to 20px" do
      expect(".pad-explicit").to have_rule("padding: 20px")
    end
  end

  context "with argument (30px 20px 10px 5px)" do
    it "sets padding to 30px 20px 10px 5px" do
      expect(".pad-shorthand").to have_rule("padding: 30px 20px 10px 5px")
    end
  end

  context "with argument (default)" do
    it "uses default gutter percentage" do
      expect(".pad-shorthand-default").to have_rule("padding: 30px 2.35765% 10px")
    end
  end

  context "with argument (null)" do
    it "ignores rules with null values" do
      ruleset = "padding-right: 10px; " +
                "padding-left: 10px;"
      bad_rule = "padding-top: null;"

      expect(".pad-null-values").to have_ruleset(ruleset)
      expect(".pad-null-values").to_not have_rule(bad_rule)
    end
  end

  context "with argument (null default)" do
    it "sets right and left paddings to gutter percentage" do
      ruleset = "padding-right: 2.35765%; " +
                "padding-left: 2.35765%;"
      bad_rule = "padding-top: null;"

      expect(".pad-null-and-default").to have_ruleset(ruleset)
      expect(".pad-null-and-default").to_not have_rule(bad_rule)
    end
  end
end

