class CreatePerformings < ActiveRecord::Migration[5.2]
  def change
    create_table :performings do |t|
      t.integer :exercise_id
      t.integer :user_id
      t.text :remarks

      t.timestamps
    end
  end
end
