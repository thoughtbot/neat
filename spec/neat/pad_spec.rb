require 'spec_helper'

describe "@include pad()" do
  let (:identifier) {"pad"}

  before(:all) do
    ParserSupport.parse_file(identifier)
  end

  context "with no argument" do
    it "sets padding to gutter percentage" do
      expect('.pad-default').to have_rule('padding: 2.35765%')
    end
  end

  context "with argument '20px'" do
    it "sets padding to '20px'" do
      expect('.pad-explicit').to have_rule('padding: 20px')
    end
  end

  context "with argument '30px 20px 10px 5px'" do
    it "sets padding to '30px 20px 10px 5px'" do
      expect('.pad-shorthand').to have_rule('padding: 30px 20px 10px 5px')
    end
  end

  context "with argument 'default' keyword" do
    it "replaces 'default' with gutter percentage" do
      expect('.pad-shorthand-default').to have_rule('padding: 30px 2.35765% 10px 2.35765%')
    end
  end
end

