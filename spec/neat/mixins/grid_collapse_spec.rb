require "spec_helper"

describe "grid-collapse" do
  before(:all) do
    ParserSupport.parse_file("mixins/grid-collapse")
  end

  context "called without a specified grid" do
    it "applies one column in the default 12-column grid" do
      ruleset = "width: calc(8.33333% - 21.66667px + 40px); " +
        "float: left; " +
        "margin-right: -20px;"

      expect(".grid-collapse-1-of-default").to have_ruleset(ruleset)
    end

    it "applies six columns in the default 12-column grid" do
      ruleset = "width: calc(50% - 30px + 40px); " +
        "float: left; " +
        "margin-right: -20px;"

      expect(".grid-collapse-6-of-default").to have_ruleset(ruleset)
    end

    it "applies twelve columns in the default 12-column grid" do
      ruleset = "width: calc(100% - 40px + 40px); " +
        "float: left; " +
        "margin-right: -20px;"

      expect(".grid-collapse-12-of-default").to have_ruleset(ruleset)
    end
  end

  context "called with a custom grid" do
    it "applies one column" do
      ruleset = "width: calc(16.66667% - 1.16667em + 2em); " +
        "float: left; " +
        "margin-right: -1em;"

      expect(".grid-collapse-1-of-6").to have_ruleset(ruleset)
    end

    it "applies four columns" do
      ruleset = "width: calc(66.66667% - 1.66667em + 2em); " +
        "float: left; " +
        "margin-right: -1em;"

      expect(".grid-collapse-4-of-6").to have_ruleset(ruleset)
    end

    it "applies six columns" do
      ruleset = "width: calc(100% - 2em + 2em); " +
        "float: left; " +
        "margin-right: -1em;"

      expect(".grid-collapse-6-of-6").to have_ruleset(ruleset)
    end
  end

  context "called with a weirder custom grid" do
    it "applies five columns" do
      ruleset = "width: calc(5.88235% - 10.58824px + 20px); " +
        "float: left; " +
        "margin-right: -10px;"

      expect(".grid-collapse-5-of-17").to have_ruleset(ruleset)
    end

    it "applies eleven columns" do
      ruleset = "width: calc(35.29412% - 13.52941px + 20px); " +
        "float: left; " +
        "margin-right: -10px;"

      expect(".grid-collapse-11-of-17").to have_ruleset(ruleset)
    end

    it "applies thirteen columns" do
      ruleset = "width: calc(70.58824% - 17.05882px + 20px); " +
        "float: left; " +
        "margin-right: -10px;"

      expect(".grid-collapse-13-of-17").to have_ruleset(ruleset)
    end
  end
end
