class AddAuthenticationTokenToUsers < ActiveRecord::Migration[5.2]
  MAX_LENGTH = 30

  def change
    add_column :users, :authentication_token, :string, limit: MAX_LENGTH
    add_index :users, :authentication_token, unique: true
  end
end
