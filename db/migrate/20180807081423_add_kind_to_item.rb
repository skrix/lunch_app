class AddKindToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :kind, :integer, null: false, default: 0
  end
end
