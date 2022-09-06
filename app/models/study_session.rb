class StudySession < ApplicationRecord
  belongs_to :assignment
  has_many :scheduled_meetings, dependent: :destroy
  has_many :users, through: :scheduled_meetings

  validates :title, presence: true, length: { minimum: 3 }
  validates :meeting_time, presence: true
  validates :duration_hours, presence: true, numericality: { in: 0..8 }
  validates :duration_minutes, presence: true, numericality: { in: 0..59 }
end
