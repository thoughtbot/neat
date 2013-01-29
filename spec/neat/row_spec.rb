require 'spec_helper'

describe "@include row()" do
  let (:identifier) {"row"}

  before(:all) do
    ParserSupport.parse_file(identifier)
  end

  context "with no argument" do
    it "adds clearfix" do
      expect('.row-default:after').to have_rule('clear: both')
    end

    it "sets display to block" do
      expect('.row-default').to have_rule('display: block')
    end
  end

  context "with argument 'table'" do
    it "sets display to table" do
      expect('.row-table').to have_rule('display: table')
    end
  end

  context "with invalid display argument" do
    it "sets display to block" do
      expect('.row-invalid-display').to have_rule('display: block')
    end
  end
end
