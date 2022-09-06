class Course < ApplicationRecord
  has_many :course_enrollments, dependent: :destroy
  has_many :users, through: :course_enrollments
  has_many :assignments, dependent: :destroy
  has_many :useful_resources, dependent: :destroy

  validates :code, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 17 }
end
