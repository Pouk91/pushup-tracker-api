class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :reps
      t.integer :sets

      t.timestamps
    end
  end
end
