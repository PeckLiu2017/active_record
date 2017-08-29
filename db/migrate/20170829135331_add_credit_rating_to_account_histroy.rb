class AddCreditRatingToAccountHistroy < ActiveRecord::Migration[5.0]
  def change
    add_column :accounthistroys, :credit_histroy, :integer
  end
end
