require 'spec_helper'

describe "@include span-columns()" do
  let (:identifier) {"span_columns"}

  before(:all) do
    ParserSupport.parse_file(identifier)
  end

  describe "when passed an int argument" do
    it "sets width in percentage" do
      expect('.span-columns-default').to have_rule('width: 48.82117%')
    end

    it "sets gutter in percentage" do
      expect('.span-columns-default').to have_rule('margin-right: 2.35765%')
    end

    it "sets display to block" do
      expect('.span-columns-default').to have_rule('display: block')
    end

    it "floats element left" do
      expect('.span-columns-default').to have_rule('float: left')
    end

    it "removes gutter from last element" do
      expect('.span-columns-default:last-child').to have_rule('margin-right: 0')
    end
  end

  describe "when nested" do
    it "sets relative width in percentage" do
      expect('.span-columns-default .span-columns-nested').to have_rule('width: 30.11389%')
    end

    it "sets relative gutter in percentage" do
      expect('.span-columns-default .span-columns-nested').to have_rule('margin-right: 4.82916%')
    end
  end

  describe "when passed display argument (table)" do
    it "sets display to table-cell" do
      expect('.span-columns-table').to have_rule('display: table-cell')
    end

    it "uses padding as gutter" do
      expect('.span-columns-table').to have_rule('padding-right: 2.35765%')
    end

    it "adjusts width of last element" do
      expect('.span-columns-table:last-child').to have_rule('width: 48.82117%')
    end
  end

  describe "when passed display argument (inline-block)" do
    it "sets display to inline-block" do
      expect('.span-columns-inline-block').to have_rule('display: inline-block')
    end
  end
end
