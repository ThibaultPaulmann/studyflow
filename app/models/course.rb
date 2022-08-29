class Course < ApplicationRecord
  has_many :course_enrollments, dependent: :destroy
  has_many :assignments, dependent: :destroy

  validates :code, presence: true
  validates :name, presence: true, length: { minimum: 3 }

end
