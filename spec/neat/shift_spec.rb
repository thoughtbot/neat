require "spec_helper"

describe "@include shift()" do
  before(:all) do
    ParserSupport.parse_file("shift")
  end

  context "with no argument" do
    it "shifts element one column in the default direction" do
      expect(".shift-default").to have_rule("margin-left: 8.5298%")
    end
  end

  context "with argument (2)" do
    it "shifts element 2 columns in the default direction" do
      expect(".shift-positive").to have_rule("margin-left: 17.05961%")
    end
  end

  context "with argument (-3)" do
    it "shifts element 3 columns in the opposite direction" do
      expect(".shift-negative").to have_rule("margin-left: -25.58941%")
    end
  end

  context "when nested" do
    it "shifts element relative to its parent" do
      expect(".shifted-parent .shifted-child").to have_rule("margin-left: 34.94305%")
    end

    it "resets nesting context" do
      expect(".post-nested-shift").to have_rule("margin-left: 17.05961%")
    end
  end

  context "when layout direction changes" do
    it "shifts element in the corresponding direction" do
      expect("section .shift-negative").to have_rule("margin-right: -25.58941%")
    end
  end
end
