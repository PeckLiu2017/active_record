class ChangeColumnsTermsOfSevice < ActiveRecord::Migration[5.0]
  def change
    change_column :people, :terms_of_service, :string
  end
end
