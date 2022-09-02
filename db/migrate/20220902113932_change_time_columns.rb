class ChangeTimeColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :assignments, :due_date
    add_column :assignments, :due_date, :datetime
    remove_column :study_sessions, :meeting_time
    add_column :study_sessions, :meeting_time, :datetime
  end
end
