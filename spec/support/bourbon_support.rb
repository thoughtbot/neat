module BourbonSupport
  def install_bourbon_files
    `bundle exec bourbon install --path test`
  end

  def remove_bourbon_files
    FileUtils.rm_rf("test/bourbon")
  end
end
