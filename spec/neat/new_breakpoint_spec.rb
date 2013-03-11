require 'spec_helper'

describe "new-breakpoint()" do
  let (:identifier) {"new-breakpoint"}

  before(:all) do
    ParserSupport.parse_file(identifier)
  end

  context "with argument 'max-width 768px 12'" do
    it "outputs (max-width 768px)" do
      expect('.responsive-element').to be_contained_in('screen and (max-width: 768px)')
    end

    it "adds 'max-width 768px 12' to visual grid breakpoints" do
      expect('$visual-grid-breakpoints').to have_value('max-width 768px 12')
    end
  end
end
