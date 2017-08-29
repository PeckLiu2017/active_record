class PictureFileCallbacks
  def after_destroy(picture_file)
    puts "call after_destroy method"
    if File.exist?(picture_file.filepath)
      File.delete(picture_file.filepath)
    end
  end
end
