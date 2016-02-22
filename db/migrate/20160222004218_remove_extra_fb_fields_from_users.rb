class RemoveExtraFbFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :oauth_token, :string
    remove_column :users, :oauth_expires_at, :string
  end
end
