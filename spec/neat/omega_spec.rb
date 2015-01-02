require "spec_helper"

describe "@include omega()" do
  before(:all) do
    ParserSupport.parse_file("omega")
  end

  context "with no argument" do
    it "removes right margin" do
      expect(".omega-default").to have_rule("margin-right: 0")
    end
  end

  context "with argument (4n)" do
    it "removes right margin of nth-child(4n)" do
      expect(".omega-nth-default:nth-child(4n)").to have_rule("margin-right: 0")
    end

    it "adds clear to nth-child(4n+1)" do
      expect(".omega-nth-default:nth-child(4n+1)").to have_rule("clear: left")
    end
  end

  context "with argument ('4n+1')" do
    it "removes right margin of nth-child(4n+1)" do
      expect(".omega-complex-nth:nth-child(4n+1)").to have_rule("margin-right: 0")
    end
  end

  context "when called inside an RTL row" do
    context "with no argument" do
      it "removes left margin" do
        expect("section .omega-default-left").to have_rule("margin-left: 0")
      end
    end

    context "with argument (4n block)" do
      it "removes left margin of nth-child(4n)" do
        expect("section .omega-nth-default-left:nth-child(4n)").to have_rule("margin-left: 0")
      end
    end
  end
end
