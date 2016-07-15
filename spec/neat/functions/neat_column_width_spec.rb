require "spec_helper"

describe "neat-column-width" do
  before(:all) do
    ParserSupport.parse_file("functions/neat-column-width")
  end

  context "called with a default twelve column grid" do
    it "applies one column" do
      rule = "width: calc(8.33333% - 21.66667px)"

      expect(".neat-column-width-1-of-12").to have_rule(rule)
    end

    it "applies six columns" do
      rule = "width: calc(50% - 30px)"

      expect(".neat-column-width-6-of-12").to have_rule(rule)
    end

    it "applies twelve columns" do
      rule = "width: calc(100% - 40px)"

      expect(".neat-column-width-12-of-12").to have_rule(rule)
    end
  end

  context "called with a custom 6 column grid" do
    it "applies one column" do
      rule = "width: calc(16.66667% - 11.66667px)"

      expect(".neat-column-width-1-of-6").to have_rule(rule)
    end

    it "applies six columns" do
      rule = "width: calc(33.33333% - 13.33333px)"

      expect(".neat-column-width-2-of-6").to have_rule(rule)
    end

    it "applies twelve columns" do
      rule = "width: calc(100% - 20px)"

      expect(".neat-column-width-6-of-6").to have_rule(rule)
    end
  end
end
