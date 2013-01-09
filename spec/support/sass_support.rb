module SassSupport
  def generate_css
    _mkdir('tmp')
    system('sass --update test:tmp --style expanded > /dev/null')
  end

  def clean_up
    FileUtils.rm_rf('tmp')
  end
end
