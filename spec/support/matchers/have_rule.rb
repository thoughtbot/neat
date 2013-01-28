RSpec::Matchers.define :have_rule do |expected|
  match do |actual|
    @rules = get_rules(actual) || []
    @rules.include? expected
  end

  failure_message_for_should do |actual|
    if @rules.empty?
      %{no CSS rules for selector #{actual} were found}
    else
      %{expected #{actual} to have CSS rule "#{expected}"}
    end
  end

  def get_rules(actual)
    style_block = ParserSupport.parser.find_by_selector(actual)
    unless style_block.empty?
      rules = style_block[0].split(';')
      rules.map(&:strip)
    end
  end
end
