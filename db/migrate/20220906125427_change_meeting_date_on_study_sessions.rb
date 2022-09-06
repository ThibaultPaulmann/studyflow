class ChangeMeetingDateOnStudySessions < ActiveRecord::Migration[7.0]
  def change
    rename_column :study_sessions, :meeting_time, :due_date
  end
end
