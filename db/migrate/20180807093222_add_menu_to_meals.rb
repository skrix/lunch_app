class AddMenuToMeals < ActiveRecord::Migration[5.2]
  def change
    add_reference :meals, :menu, foreign_key: true
  end
end
