require 'spec_helper'

describe "@include omega()" do
  let (:identifier) {"omega"}

  before(:all) do
    ParserSupport.parse_file(identifier)
  end

  it "removes right margin with no argument" do
    expect('.omega-default').to have_rule('margin-right: 0')
  end

  it "removes right padding with argument (table)" do
    expect('.omega-table').to have_rule('padding-right: 0')
  end

  it "removes left margin with argument (block, left)" do
    expect('.omega-block-left').to have_rule('margin-left: 0')
  end

  it "removes left padding with argument (table, left)" do
    expect('.omega-table-left').to have_rule('padding-left: 0')
  end

  it "removes margin right of nth-child(4n) with argument (4n)" do
    expect('.omega-nth-default:nth-child(4n)').to have_rule('margin-right: 0')
  end

  it "removes padding right of nth-child(4n) with argument (4n table)" do
    expect('.omega-nth-table:nth-child(4n)').to have_rule('padding-right: 0')
  end

  it "removes margin left of nth-child(4n) with argument (4n block, left)" do
    expect('.omega-nth-default-left:nth-child(4n)').to have_rule('margin-left: 0')
  end

  it "removes padding left of nth-child(4n) with argument (4n table, left)" do
    expect('.omega-nth-table-left:nth-child(4n)').to have_rule('padding-left: 0')
  end
end
