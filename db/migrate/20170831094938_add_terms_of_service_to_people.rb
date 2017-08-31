class AddTermsOfServiceToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :terms_of_sevice, :boolean
  end
end
