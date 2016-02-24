class EditTimeZoneOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :timezone, :string, default: "-8"
  end
end
