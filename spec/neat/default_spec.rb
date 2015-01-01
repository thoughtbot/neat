require "spec_helper"

describe "By default" do
  before(:all) do
    ParserSupport.parse_file("default")
  end

  it "sets sizing on the html element to border-box" do
    expect("html").to have_rule("box-sizing: border-box")
  end

  it "sets sizing on the global selector to inherit" do
    expect("*::after").to have_rule("box-sizing: inherit")
  end
end
