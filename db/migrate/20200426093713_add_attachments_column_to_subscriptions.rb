class AddAttachmentsColumnToSubscriptions < ActiveRecord::Migration[6.0]
  def change
  	add_column :subscriptions, :attachments, :text
  end
end
