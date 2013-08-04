require 'spec_helper'

describe "@include span-columns()" do
  before(:all) do
    ParserSupport.parse_file("span-columns")
    ParserSupport.parse_file("span-columns-fixed")
  end

  context "with argument (6) in a twelve-column grid" do
    context "in a flex grid" do
      it "sets width in percentage" do
        expect('.span-columns-default').to have_rule('width: 48.82117%')
      end

      it "sets gutter in percentage" do
        expect('.span-columns-default').to have_rule('margin-right: 2.35765%')
      end
    end

    context "in a fixed grid" do
      it "sets width in pixels" do
        expect('.span-columns-fixed-default').to have_rule('width: 468px')
      end

      it "sets gutter in pixels" do
        expect('.span-columns-fixed-default').to have_rule('margin-right: 24px')
      end
    end

    it "sets display to block" do
      expect('.span-columns-default').to have_rule('display: block')
    end

    it "sets float to left" do
      expect('.span-columns-default').to have_rule('float: left')
    end

    it "removes gutter from last element" do
      expect('.span-columns-default:last-child').to have_rule('margin-right: 0')
    end
  end

  context "when nested" do
    it "sets relative width in percentage" do
      expect('.span-columns-default .span-columns-nested').to have_rule('width: 30.11389%')
    end

    it "sets relative gutter in percentage" do
      expect('.span-columns-default .span-columns-nested').to have_rule('margin-right: 4.82916%')
    end
  end

  context "with argument (table)" do
    it "sets display to table-cell" do
      expect('.span-columns-table').to have_rule('display: table-cell')
    end

    context "in a flex grid" do
      it "sets padding evenly between table cells" do
        expect('.span-columns-table').to have_rule('padding-right: 1.17883%')
      end
    end

    context "in a fixed grid" do
      it "sets padding evenly between table cells" do
        expect('.span-columns-fixed-table').to have_rule('padding-right: 12px')
      end
    end
  end

  context "with argument (collapse)" do
    context "in a flex grid" do
      it "appends gutter width to column width" do
        expect('.span-columns-collapse').to have_rule('width: 51.17883%')
      end
    end

    context "in a fixed grid" do
      it "appends gutter width to columns with" do
        expect('.span-columns-fixed-collapse').to have_rule('width: 492px')
      end
    end

    it "removes the next gutter" do
      expect('.span-columns-collapse').to_not have_rule('margin-right')
    end
  end
end
