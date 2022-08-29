class CourseEnrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :creator, presence: true, inclusion: { [true, false] }
end
