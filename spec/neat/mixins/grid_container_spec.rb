require "spec_helper"

describe "grid-container" do
  before(:all) do
    ParserSupport.parse_file("mixins/grid-container")
  end

  context "called with default settings" do
    it "adds after element" do
      ruleset = "clear: both; " +
        "content: \"\"; " +
        "display: block;"

      expect(".grid-container::after").to have_ruleset(ruleset)
    end
  end
end
