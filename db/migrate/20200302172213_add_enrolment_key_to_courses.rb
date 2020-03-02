class AddEnrolmentKeyToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :enrolment_key, :string
  end
end
