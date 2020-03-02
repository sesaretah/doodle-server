class AddCourseIdToExercise < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :course_id, :integer
  end
end
