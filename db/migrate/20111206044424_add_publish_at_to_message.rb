class AddPublishAtToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :publish_at, :datetime
  end
end
