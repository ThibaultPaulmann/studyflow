class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :study_sessions, :duration_hours, :integer
    add_column :study_sessions, :duration_minutes, :integer
  end
end
