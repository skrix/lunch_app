class AddItemDrink < SeedMigration::Migration
  def up
    Item.create!(
      name:  'Daiquiri',
      price: 39.99,
      kind:  Item::DRINK
    )
  end

  def down
    Item.find_by(name: 'Daiquiri')
        &.destroy
  end
end
