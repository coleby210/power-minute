class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :workout_template, index: true, foreign_key: true, null: false
      t.integer :reps

      t.timestamps null: false
    end
  end
end
