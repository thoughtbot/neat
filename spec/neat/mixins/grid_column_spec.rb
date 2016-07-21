require "spec_helper"

describe "grid-column" do
  before(:all) do
    ParserSupport.parse_file("mixins/grid-column")
  end

  context "called without a specified grid" do
    it "applies one column in the default 12-column grid" do
      ruleset = "width: calc(8.33333% - 21.66667px); " +
        "float: left; " +
        "margin-left: 20px;"

      expect(".grid-column-1-of-default").to have_ruleset(ruleset)
    end

    it "applies six columns in the default 12-column grid" do
      ruleset = "width: calc(50% - 30px); " +
        "float: left; " +
        "margin-left: 20px;"

      expect(".grid-column-6-of-default").to have_ruleset(ruleset)
    end

    it "applies twelve columns in the default 12-column grid" do
      ruleset = "width: calc(100% - 40px); " +
        "float: left; " +
        "margin-left: 20px;"

      expect(".grid-column-12-of-default").to have_ruleset(ruleset)
    end

    it "applies a three fifths column in shorthand with the default grid" do
      ruleset = "width: calc(60% - 32px); " +
        "float: left; " +
        "margin-left: 20px;"

      expect(".grid-column-3-of-5-shorthand").to have_ruleset(ruleset)
    end
  end

  context "called with a custom grid" do
    it "applies one column" do
      ruleset = "width: calc(16.66667% - 1.16667em); " +
        "float: left; " +
        "margin-left: 1em;"

      expect(".grid-column-1-of-6").to have_ruleset(ruleset)
    end

    it "applies four columns" do
      ruleset = "width: calc(66.66667% - 1.66667em); " +
        "float: left; " +
        "margin-left: 1em;"

      expect(".grid-column-4-of-6").to have_ruleset(ruleset)
    end

    it "applies six columns" do
      ruleset = "width: calc(100% - 2em); " +
        "float: left; " +
        "margin-left: 1em;"

      expect(".grid-column-6-of-6").to have_ruleset(ruleset)
    end

    it "applies a three fifths column in shorthand" do
      ruleset = "width: calc(60% - 1.6em); " +
        "float: left; " +
        "margin-left: 1em;"

      expect(".grid-column-3-of-5-shorthand-six-grid").to have_ruleset(ruleset)
    end
  end

  context "called with a weirder custom grid" do
    it "applies five columns" do
      ruleset = "width: calc(5.88235% - 10.58824px); " +
        "float: left; " +
        "margin-left: 10px;"

      expect(".grid-column-5-of-17").to have_ruleset(ruleset)
    end

    it "applies eleven columns" do
      ruleset = "width: calc(35.29412% - 13.52941px); " +
        "float: left; " +
        "margin-left: 10px;"

      expect(".grid-column-11-of-17").to have_ruleset(ruleset)
    end

    it "applies thirteen columns" do
      ruleset = "width: calc(70.58824% - 17.05882px); " +
        "float: left; " +
        "margin-left: 10px;"

      expect(".grid-column-13-of-17").to have_ruleset(ruleset)
    end
  end
end
