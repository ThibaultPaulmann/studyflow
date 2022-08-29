class CreateUserAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_assignments do |t|
      t.references :assignment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :user_progress
      t.integer :difficulty

      t.timestamps
    end
  end
end
