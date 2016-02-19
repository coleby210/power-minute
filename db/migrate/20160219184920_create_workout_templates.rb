class CreateWorkoutTemplates < ActiveRecord::Migration
  def change
    create_table :workout_templates do |t|
      t.string :title, null: false
      t.string :description
      t.string :image
      t.integer :creator_id
      t.references :category, index: true, null: false

      t.timestamps null: false
    end
  end
end
