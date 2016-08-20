require "spec_helper"

describe "@include grid-media() {...}" do
  before(:all) do
    ParserSupport.parse_file("mixins/grid-media")
  end

  context "with argument ($custom-neat-grid)" do
    it "outputs @media only screen and (min-width: 1000px)" do
      expect(".grid-column-media-custom-neat-grid").to be_contained_in("only screen and (min-width: 1000px)")
    end
  end

  context "with argument ($specific-neat-grid)" do
    it "outputs @media only screen and (min-width: 1000px) and (max-width: 1100px)" do
      expect(".grid-column-media-specific-neat-grid").to be_contained_in("only screen and (min-width: 1000px) and (max-width: 1100px)")
    end
  end

  context "with argument ($print-neat-grid)" do
    it "outputs @media print" do
      expect(".grid-column-media-print-neat-grid").to be_contained_in("print")
    end
  end
end
