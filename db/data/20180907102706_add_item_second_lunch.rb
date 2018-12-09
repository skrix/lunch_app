class AddItemSecondLunch < SeedMigration::Migration
  def up
    Item.create!(
      name:  'Pasta e Fagioli',
      price: 64.50,
      kind:  Item::SECOND_LUNCH
    )
  end

  def down
    Item.find_by(name: 'Pasta e Fagioli')
        &.destroy
  end
end
