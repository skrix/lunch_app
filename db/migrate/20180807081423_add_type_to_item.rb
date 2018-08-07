class AddTypeToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :type, :integer, null: false, default: 0
  end
end
