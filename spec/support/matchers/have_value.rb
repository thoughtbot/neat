RSpec::Matchers.define :have_value do |expected|
  match do |actual|
    selector_id = actual.sub("$","#")
    value_attribute = ParserSupport.parser.find_by_selector(selector_id)[0]

    unless value_attribute.nil?
      actual_value = value_attribute.split(":")[1].strip.sub(";", "")
      actual_value == expected
    end
  end

  failure_message do |actual|
    %{expected variable #{actual} to have value "#{expected}"}
  end
end
