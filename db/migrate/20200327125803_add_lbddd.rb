class AddLbddd < ActiveRecord::Migration[5.0]
  def change
    remove_column :subscriptions,:lunch,:hstore
    remove_column :subscriptions,:dinner,:hstore

    add_column :subscriptions,:lunch,:text
    add_column :subscriptions,:dinner,:text
    add_column :subscriptions,:breakfast,:text
  end
end
