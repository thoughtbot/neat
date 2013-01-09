RSpec::Matchers.define :have_rule do |expected|
  match do |actual|
    @rules = get_rules(actual)? get_rules(actual) : []
    @rules.include? expected
  end

  failure_message_for_should do |actual|
    if @rules.empty?
      "selector #{actual} not found"
    else
      "expected #{actual} to have rule \"#{expected}\""
    end
  end

  def get_rules(actual)
    style_block = $parser.find_by_selector(actual)
    unless style_block.empty?
      rules = style_block[0].split(';')
      rules.each do |rule|
        rule.gsub!(/^(\s)|(\s)$/, "")
      end
      rules
    end
  end
end
