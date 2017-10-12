class CreateAddPhoneToUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :add_phone_to_users do |t|
      t.string :phone_no

      t.timestamps
    end
  end
end
