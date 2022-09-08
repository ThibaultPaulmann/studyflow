class AddZoomMeetingIdToStudySessions < ActiveRecord::Migration[7.0]
  def change
    add_column :study_sessions, :zoom_meeting_id, :integer
  end
end
