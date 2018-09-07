class AddItemDrink < SeedMigration::Migration
  def up
    Item.create!({
      name:  'Daiquiri',
      price: 39.99,
      kind:  Item::DRINK
    })
  end

  def down
    Item.destroy_all(name: 'Daiquiri')
  end
end
