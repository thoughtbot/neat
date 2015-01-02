require "spec_helper"

describe "@include display-context() {...}" do
  before(:all) do
    ParserSupport.parse_file("display-context")
  end

  context "with argument (table)" do
    it "changes display value to table" do
      expect(".display-table-block").to have_rule("display: table-cell")
    end
  end

  context "whith nested call and argument (block)" do
    it "changes display value to block" do
      expect(".display-nested-block").to have_rule("display: block")
    end
  end
end
