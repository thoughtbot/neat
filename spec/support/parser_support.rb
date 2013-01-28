module ParserSupport
  def self.parser
    @parser ||= CssParser::Parser.new
  end

  def self.parse_file(identifier)
    self.parser.load_file!("tmp/#{identifier}.css")
  end
end
