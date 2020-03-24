class RemoveRestaurantForeignKeyOnSubscriptions < ActiveRecord::Migration[5.0]
  def change

  	remove_foreign_key :subscriptions, column: :restuarants_id
  end

end
