class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.references :course, null: false, foreign_key: true
      t.time :due_date
      t.string :title
      t.float :rating

      t.timestamps
    end
  end
end
