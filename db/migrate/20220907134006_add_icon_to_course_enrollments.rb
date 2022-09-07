class AddIconToCourseEnrollments < ActiveRecord::Migration[7.0]
  def change
    add_column :course_enrollments, :icon, :string, default: "graduation-cap", null: false
  end
end
