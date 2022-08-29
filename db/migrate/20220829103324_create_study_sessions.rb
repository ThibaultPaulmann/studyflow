class CreateStudySessions < ActiveRecord::Migration[7.0]
  def change
    create_table :study_sessions do |t|
      t.references :assignment, null: false, foreign_key: true
      t.string :title
      t.time :meeting_time
      t.time :duration

      t.timestamps
    end
  end
end
