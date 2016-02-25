class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.references :schedule, index: true, foreign_key: true
      t.string :name, presence: true
      t.boolean :zero, default: false
      t.boolean :one, default: false
      t.boolean :two, default: false
      t.boolean :three, default: false
      t.boolean :four, default: false
      t.boolean :five, default: false
      t.boolean :six, default: false
      t.boolean :seven, default: false
      t.boolean :eight, default: false
      t.boolean :nine, default: false
      t.boolean :ten, default: false
      t.boolean :eleven, default: false
      t.boolean :twelve, default: false
      t.boolean :thirteen, default: false
      t.boolean :fourteen, default: false
      t.boolean :fifteen, default: false
      t.boolean :sixteen, default: false
      t.boolean :seventeen, default: false
      t.boolean :eighteen, default: false
      t.boolean :nineteen, default: false
      t.boolean :twenty, default: false
      t.boolean :twentyone, default: false
      t.boolean :twentytwo, default: false
      t.boolean :twentythree, default: false

      t.timestamps null: false
    end
  end
end
