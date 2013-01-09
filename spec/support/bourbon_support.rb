module BourbonSupport
  def install_bourbon_files
      system("bourbon install --path test > /dev/null")
  end

  def remove_bourbon_files
    FileUtils.rm_rf('test/bourbon')
  end
end
