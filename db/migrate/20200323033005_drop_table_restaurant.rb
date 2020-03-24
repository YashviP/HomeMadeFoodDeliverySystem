class DropTableRestaurant < ActiveRecord::Migration[5.0]
  def up
    drop_table :restaurants
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
