require "spec_helper"

describe "@include direction-context() {...}" do
  before(:all) do
    ParserSupport.parse_file("direction-context")
  end

  context "with no argument" do
    it "uses default direction setting" do
      expect(".default-block").to have_rule("float: left")
    end
  end

  context "whith argument (right-to-left)" do
    it "changes direction setting inside the block" do
      expect(".right-to-left-block").to have_rule("float: right")
    end
  end
end
