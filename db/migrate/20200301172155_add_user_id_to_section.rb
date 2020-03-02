class AddUserIdToSection < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :user_id, :integer
  end
end
