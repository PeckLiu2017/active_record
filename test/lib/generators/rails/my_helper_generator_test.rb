require 'test_helper'
require 'generators/rails/my_helper/my_helper_generator'

# active_record/lib/generators/rails/my_helper/my_helper_generator.rb
# active_record/test/lib/generators/rails/my_helper_generator_test.rb
# test/lib/generators/rails/my_helper_generator_test.rb
class Rails::MyHelperGeneratorTest < Rails::Generators::TestCase
  tests Rails::MyHelperGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
