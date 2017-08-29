class CreatePictureFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :picture_files do |t|
      t.string :filepath
      t.string :filename
      t.string :fileinfo

      t.timestamps
    end
  end
end
