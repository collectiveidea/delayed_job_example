class AddAccessSecretToUser < ActiveRecord::Migration
  def change
    add_column :users, :twitter_access_secret, :string
  end
end
