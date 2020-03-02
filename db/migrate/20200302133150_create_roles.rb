class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :title
      t.boolean :default
      t.json :abilities
      t.integer :user_id

      t.timestamps
    end
  end
end
