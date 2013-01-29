require 'spec_helper'

describe "@include shift()" do
  let (:identifier) {"shift"}

  before(:all) do
    ParserSupport.parse_file(identifier)
  end

  context "when passed no argument" do
    it "shifts element one column to the left" do
      expect('.shift-default').to have_rule('margin-left: 8.5298%')
    end
  end

  context "when passed '2'" do
    it "shifts element 2 column to the left" do
      expect('.shift-positive').to have_rule('margin-left: 17.05961%')
    end
  end

  context "when passed '-3'" do
    it "shifts element 3 column to the right" do
      expect('.shift-negative').to have_rule('margin-left: -25.58941%')
    end
  end
end
