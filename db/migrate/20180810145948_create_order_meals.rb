class CreateOrderMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :order_meals do |t|
      t.references :order, foreign_key: true, index: true
      t.references :meal, foreign_key: true, index: true

      t.timestamps
    end
  end
end
