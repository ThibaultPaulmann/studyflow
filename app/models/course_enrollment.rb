class CourseEnrollment < ApplicationRecord
  COLORS = ["#1f2f98","#f04393", "#7be495", "#fe7a15", "#522157", "#f8d90f"]
  
  belongs_to :user
  belongs_to :course
  
  validates :user, uniqueness: { scope: :course }
end
