class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.belongs_to :users
      t.timestamps
    end
  end
end
