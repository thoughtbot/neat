require "spec_helper"

describe "neat-opposite-direction" do
  before(:all) do
    ParserSupport.parse_file("functions/neat-opposite-direction")
  end

  context "called with ltr" do
    it "returns right" do
      rule = "content: right"

      expect(".neat-opposite-direction-ltr").to have_rule(rule)
    end
  end

  context "called with rtl" do
    it "returns left" do
      rule = "content: left"

      expect(".neat-opposite-direction-rtl").to have_rule(rule)
    end
  end
end
