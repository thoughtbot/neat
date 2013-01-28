module SassSupport
  def generate_css
    _mkdir('tmp')
    `sass --update test:tmp --style expanded`
  end

  def clean_up
    FileUtils.rm_rf('tmp')
  end
end
