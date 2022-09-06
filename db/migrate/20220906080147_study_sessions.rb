class StudySessions < ActiveRecord::Migration[7.0]
  def change
    remove_column :study_sessions, :duration
  end
end
