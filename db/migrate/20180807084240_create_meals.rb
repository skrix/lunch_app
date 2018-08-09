class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.decimal :price

      t.timestamps
    end
  end
end
