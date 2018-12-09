class AddItemFirstLunch < SeedMigration::Migration
  def up
    Item.create!(
      name:  'Borscht',
      price: 999.99,
      kind:  Item::FIRST_LUNCH
    )
  end

  def down
    Item.find_by(name: 'Borscht')
        &.destroy
  end
end
