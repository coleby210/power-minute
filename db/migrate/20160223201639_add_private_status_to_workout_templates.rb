class AddPrivateStatusToWorkoutTemplates < ActiveRecord::Migration
  def change
    add_column :workout_templates, :private_status, :boolean, default: false
  end
end
