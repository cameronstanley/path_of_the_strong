class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.integer :movement_id

      t.timestamps
    end
  end
end
