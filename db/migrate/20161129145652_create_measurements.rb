class CreateMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :measurements do |t|
      t.integer :user_id
      t.date :measured_at
      t.float :weight

      t.timestamps
    end
  end
end
