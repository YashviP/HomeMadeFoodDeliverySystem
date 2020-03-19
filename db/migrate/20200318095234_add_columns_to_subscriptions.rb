class AddColumnsToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :is_breakfast_included, :boolean
    add_column :subscriptions, :breakfast_item, :string
    add_column :subscriptions, :breakfast_price, :number
    add_column :subscriptions, :is_lunch_included, :boolean
    add_column :subscriptions, :lunch_item, :string
    add_column :subscriptions, :lunch_price, :number
    add_column :subscriptions, :is_dinner_included, :boolean
    add_column :subscriptions, :dinner_item, :string
    add_column :subscriptions, :dinner_price, :number
    add_column :subscriptions, :is_veg, :boolean
    add_column :subscriptions, :is_nonVeg, :boolean
  end
end
