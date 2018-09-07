class AddItemFirstLunch < SeedMigration::Migration
  def up
    Item.create!(
      name:  'Borscht',
      price: 999.99,
      kind:  Item::FIRST_LUNCH
    )
  end

  def down
    Item.destroy_all(name: 'Borscht')
  end
end
