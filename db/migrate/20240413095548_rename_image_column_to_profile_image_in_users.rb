class RenameImageColumnToProfileImageInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :image, :profile_image
  end
end
