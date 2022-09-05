class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  acts_as_voter

  has_many :course_enrollments, dependent: :destroy
  has_many :courses, through: :course_enrollments

  has_many :user_assignments, dependent: :destroy
  has_many :assignments, through: :user_assignments

  has_many :questions
  has_many :answers

  has_many :scheduled_meetings, dependent: :destroy
  has_many :study_sessions, through: :scheduled_meetings
end
