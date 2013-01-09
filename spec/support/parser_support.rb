module ParserSupport
  def initialize_parser
    $parser = CssParser::Parser.new
  end

  def parse_css_file(identifier)
    initialize_parser if !$parser
    $parser.load_file!("tmp/#{identifier}.css")
  end
end
