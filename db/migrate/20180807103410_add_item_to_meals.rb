class AddItemToMeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :item, foreign_key: true, index: true
  end
end
