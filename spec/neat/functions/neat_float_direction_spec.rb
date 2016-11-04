require "spec_helper"

describe "neat-float-direction" do
  before(:all) do
    ParserSupport.parse_file("functions/neat-float-direction")
  end

  context "called with ltr" do
    it "returns left" do
      rule = "content: left"

      expect(".neat-float-direction-ltr").to have_rule(rule)
    end
  end

  context "called with rtl" do
    it "returns right" do
      rule = "content: right"

      expect(".neat-float-direction-rtl").to have_rule(rule)
    end
  end
end
