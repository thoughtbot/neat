require 'spec_helper'

describe "@include omega()" do
  let (:identifier) {"omega"}

  before(:all) do
    ParserSupport.parse_file(identifier)
  end

  context "when passed no argument" do
    it "removes right margin" do
      expect('.omega-default').to have_rule('margin-right: 0')
    end
  end

  context "when passed 'table'" do
    it "removes right padding" do
      expect('.omega-table').to have_rule('padding-right: 0')
    end
  end

  context "when passed 'block, left'" do
    it "removes left margin" do
      expect('.omega-block-left').to have_rule('margin-left: 0')
    end
  end

  context "when passed 'table, left'" do
    it "removes left padding" do
      expect('.omega-table-left').to have_rule('padding-left: 0')
    end
  end

  context "when passed '4n'" do
    it "removes right margin of nth-child(4n)" do
      expect('.omega-nth-default:nth-child(4n)').to have_rule('margin-right: 0')
    end
  end

  context "when passed '4n table'" do
    it "removes right padding of nth-child(4n)" do
      expect('.omega-nth-table:nth-child(4n)').to have_rule('padding-right: 0')
    end
  end

  context "when passed '4n block, left'" do
    it "removes left margin of nth-child(4n)" do
      expect('.omega-nth-default-left:nth-child(4n)').to have_rule('margin-left: 0')
    end
  end

  context "when passed '4n table, left'" do
    it "removes left padding of nth-child(4n)" do
      expect('.omega-nth-table-left:nth-child(4n)').to have_rule('padding-left: 0')
    end
  end
end
