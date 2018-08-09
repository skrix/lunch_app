class AddKindToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :kind, :string, null: false, default: Item::FIRST_LUNCH
  end
end
