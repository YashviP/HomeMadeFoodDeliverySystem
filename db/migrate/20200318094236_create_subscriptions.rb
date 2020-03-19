class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :restaurants
      t.belongs_to :current_user_subscriptions
      t.timestamps
    end
  end
end
