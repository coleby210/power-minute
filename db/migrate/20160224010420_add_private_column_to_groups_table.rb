class AddPrivateColumnToGroupsTable < ActiveRecord::Migration
  def change
    add_column :groups, :private_status, :boolean
  end
end
