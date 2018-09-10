module SassSupport
  def generate_css
    _mkdir("tmp")
    `sass -I . --update test:tmp --precision 5`
  end

  def clean_up
    FileUtils.rm_rf("tmp")
  end
end
