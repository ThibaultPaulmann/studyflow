class CourseEnrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :creator, presence: true, inclusion: { in: [true, false] }
end
