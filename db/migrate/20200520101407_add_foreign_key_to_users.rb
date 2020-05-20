class AddForeignKeyToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :subscriptions do |t|
      t.belongs_to :user
    end
  end
end
