class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :title
      t.text :description
      t.integer :course_id
      t.datetime :start_date
      t.datetime :due_date

      t.timestamps
    end
  end
end
