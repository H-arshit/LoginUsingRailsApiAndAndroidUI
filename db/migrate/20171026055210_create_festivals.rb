class CreateFestivals < ActiveRecord::Migration[5.1]
  def change
    create_table :festivals do |t|
      t.date :day
      t.string :name
      t.string :place

      t.timestamps
    end
  end
end
