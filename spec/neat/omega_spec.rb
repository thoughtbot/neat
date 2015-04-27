require "spec_helper"

describe "@include omega()" do
  before(:all) do
    ParserSupport.parse_file("omega")
  end

  context "with no argument" do
    it "removes right margin" do
      selector = ".omega-default"
      expect(selector).to have_rule("margin-right: 0")
    end
  end

  context "with argument (4n)" do
    it "removes right margin of nth-child(4n)" do
      selector = ".omega-nth-default:nth-child(4n)"
      expect(selector).to have_rule("margin-right: 0")
    end

    it "adds clear to nth-child(4n+1)" do
      selector = ".omega-nth-default:nth-child(4n+1)"
      expect(selector).to have_rule("clear: left")
    end
  end

  context "with argument ('4n+1')" do
    it "removes right margin of nth-child(4n+1)" do
      selector = ".omega-complex-nth:nth-child(4n+1)"
      expect(selector).to have_rule("margin-right: 0")
    end

    it "adds clear to nth-child('4n+2')" do
      selector = ".omega-complex-nth:nth-child(4n+2)"
      expect(selector).to have_rule("clear: left")
    end
  end

  context "with argument ('3n-1')" do
    it "removes right margin of nth-child(3n-1)" do
      selector = ".omega-complex-nth-negative:nth-child(3n-1)"
      expect(selector).to have_rule("margin-right: 0")
    end

    it "adds clear to nth-child('3n-0')" do
      selector = ".omega-complex-nth-negative:nth-child(3n-0)"
      expect(selector).to have_rule("clear: left")
    end
  end

  context "when called inside an RTL row" do
    context "with no argument" do
      it "removes left margin" do
        selector = "section .omega-default-left"
        expect(selector).to have_rule("margin-left: 0")
      end
    end

    context "with argument (4n block)" do
      it "removes left margin of nth-child(4n)" do
        selector = "section .omega-nth-default-left:nth-child(4n)"
        expect(selector).to have_rule("margin-left: 0")
      end
    end
  end
end
