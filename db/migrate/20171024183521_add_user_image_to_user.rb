class AddUserImageToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image, :string , :default => "/userimage/default.png"
  end
end
