require 'spec_helper'

describe "@include pad()" do
  before(:all) do
    ParserSupport.parse_file("pad")
    ParserSupport.parse_file("pad-fixed")
  end

  context "with no argument" do
    context "in a flex grid" do
      it "sets padding to gutter percentage" do
        expect('.pad-default').to have_rule('padding: 2.35765%')
      end
    end

    context "in a fixed grid" do
      it "sets padding to gutter width" do
        expect('.pad-fixed-default').to have_rule('padding: 24px')
      end
    end
  end

  context "with argument (20px)" do
    it "sets padding to 20px" do
      expect('.pad-explicit').to have_rule('padding: 20px')
    end
  end

  context "with argument (30px 20px 10px 5px)" do
    it "sets padding to 30px 20px 10px 5px" do
      expect('.pad-shorthand').to have_rule('padding: 30px 20px 10px 5px')
    end
  end

  context "with argument (default)" do
    context "in a flex grid" do
      it "uses default gutter percentage" do
        expect('.pad-shorthand-default').to have_rule('padding: 30px 2.35765% 10px 2.35765%')
      end
    end

    context "in a fixed grid" do
      it "uses default gutter width" do
        expect('.pad-fixed-shorthand-default').to have_rule('padding: 30px 24px 10px 24px')
      end
    end
  end
end

