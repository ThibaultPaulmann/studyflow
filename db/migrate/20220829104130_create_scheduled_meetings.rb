class CreateScheduledMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :scheduled_meetings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :study_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
