require 'spec_helper'

describe "@include shift()" do
  let (:identifier) {"shift"}

  before(:all) do
    ParserSupport.parse_file(identifier)
  end

  context "with no argument" do
    it "shifts element one column to the left" do
      expect('.shift-default').to have_rule('margin-left: 8.5298%')
    end
  end

  context "with argument '2'" do
    it "shifts element 2 column to the left" do
      expect('.shift-positive').to have_rule('margin-left: 17.05961%')
    end
  end

  context "with argument '-3'" do
    it "shifts element 3 column to the right" do
      expect('.shift-negative').to have_rule('margin-left: -25.58941%')
    end
  end

  context "when nested" do
    it "shifts element relative to its parent" do
      expect('.shifted-parent .shifted-child').to have_rule('margin-left: 34.94305%')
    end

    it "resets nesting context" do
      expect('.post-nested-shift').to have_rule('margin-left: 17.05961%')
    end
  end
end
