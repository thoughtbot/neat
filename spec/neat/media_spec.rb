require 'spec_helper'

describe "@include media()" do
  before(:all) do
    ParserSupport.parse_file("media")
  end

  context "with argument (481px)" do
    it "outputs @media screen and (min-width: 481px)" do
      expect('.media-default').to be_contained_in('screen and (min-width: 481px)')
    end
  end

  context "with argument (max-width 480px)" do
    it "outputs @media screen and (max-width: 480px)" do
      expect('.media-max-width').to be_contained_in('screen and (max-width: 480px)')
    end
  end

  context "with argument (min-width 320px max-width 480px)" do
    it "outputs @media screen and (min-width: 320px) and (max-width: 480px)" do
      expect('.media-min-max-width').to be_contained_in('screen and (min-width: 320px) and (max-width: 480px)')
    end
  end

  context "with argument (481px, 6)" do
    it "outputs @media screen and (min-width: 481px)" do
      expect('.change-media-context').to be_contained_in('screen and (min-width: 481px)')
    end

    it "uses a 6-column grid" do
      expect('.change-media-context').to have_rule('width: 100%')
    end
  end

  context "with shorthand argument (max-width 480px 6)" do
    it "outputs @media screen and (max-width: 480px)" do
      expect('.change-media-context-shorthand').to be_contained_in('screen and (max-width: 480px)')
    end

    it "uses a 6-column grid" do
      expect('.change-media-context-shorthand').to have_rule('width: 100%')
    end
  end

  context "with composite argument (max-width 768px min-width 110px orientation portait 6)" do
    it "outputs @media screen and (max-width: 768px) and (min-width: 110px) and (orientation: portait)" do
      expect('.composite-media-query').to be_contained_in('screen and (max-width: 768px) and (min-width: 110px) and (orientation: portait)')
    end

    it "uses a 6-column grid" do
      expect('.composite-media-query').to have_rule('width: 100%')
    end
  end
end
