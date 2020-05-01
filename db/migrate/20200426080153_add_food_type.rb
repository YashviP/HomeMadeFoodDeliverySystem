class AddFoodType < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :food_type, :boolean
    remove_column  :subscriptions,:is_veg,:boolean
    remove_column :subscriptions, :is_nonVeg,:boolean
  end
end
