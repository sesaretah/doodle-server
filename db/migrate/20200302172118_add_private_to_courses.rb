class AddPrivateToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :private, :boolean
  end
end
