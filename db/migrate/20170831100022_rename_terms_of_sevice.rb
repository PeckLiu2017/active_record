class RenameTermsOfSevice < ActiveRecord::Migration[5.0]
  def change
    change_table :people do |t|
      t.rename :terms_of_sevice, :terms_of_service
    end
  end
end
