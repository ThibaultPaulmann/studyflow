class AddVenueToStudySessions < ActiveRecord::Migration[7.0]
  def change
    add_column :study_sessions, :venue, :string
  end
end
