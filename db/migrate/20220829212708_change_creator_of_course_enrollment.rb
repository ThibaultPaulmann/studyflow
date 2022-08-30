class ChangeCreatorOfCourseEnrollment < ActiveRecord::Migration[7.0]
  def change
    change_column :course_enrollments, :creator, :boolean, null: false, default: false
  end
end
