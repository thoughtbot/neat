require 'spec_helper'

describe "@include display() {...}" do
  before(:all) do
    ParserSupport.parse_file("display")
  end

  context "with argument (table)" do
    it "changes default display value to table" do
      expect('.display-table-block').to have_rule('display: table-cell')
    end
  end
end
