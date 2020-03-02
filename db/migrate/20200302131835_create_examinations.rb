class CreateExaminations < ActiveRecord::Migration[5.2]
  def change
    create_table :examinations do |t|
      t.integer :exam_id
      t.integer :user_id
      t.float :grade

      t.timestamps
    end
  end
end
