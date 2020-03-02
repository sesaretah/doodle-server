class AddUserIdToExam < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :user_id, :integer
  end
end
