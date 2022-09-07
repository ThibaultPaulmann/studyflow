class AddColorToCourseEnrollment < ActiveRecord::Migration[7.0]
  def change
    add_column :course_enrollments, :color, :string, null: false, default: "#1f2f98"
  end
end
