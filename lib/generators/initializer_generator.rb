class InitializerGenerator < Rails::Generators::Base
  desc "This generator creates an initializer file at
config/initializers"
  def create_initializer_file
    create_file "config/initializers/initializer.rb",
    "# 这里是初始化文件的内容\n puts 'create first initializer'"
  end
end
