RSpec::Matchers.define :have_rule do |expected|
  match do |actual|
    @rules = rules_from_selector(actual)
    @rules.include? expected
  end

  failure_message_for_should do |actual|
    if @rules.empty?
      %{no CSS rules for selector #{actual} were found}
    else
      %{expected selector #{actual} to have CSS rule "#{expected}"}
    end
  end

  def rules_from_selector(selector)
    rulesets = ParserSupport.parser.find_by_selector(selector)
    if rulesets.empty?
      []
    else
      rules(rulesets)
    end
  end

  def rules(rulesets)
    rules = []
    rulesets.map do |ruleset|
      ruleset.split(';').each do |rule|
        rules << rule.strip
      end
    end
    rules
  end
end
