class CreateWorkSets < ActiveRecord::Migration[5.0]
  def change
    create_table :work_sets do |t|
      t.integer :exercise_id
      t.integer :repetitions
      t.integer :weight

      t.timestamps
    end
  end
end
