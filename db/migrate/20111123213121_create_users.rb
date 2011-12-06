class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :twitter_uid
      t.string :twitter_access_token
      t.string :token

      t.timestamps
    end
  end
end
