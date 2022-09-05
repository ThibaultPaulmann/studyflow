class StudySession < ApplicationRecord
  belongs_to :assignment3
  has_many :scheduled_meetings, dependent: :destroy
  has_many :users, through: :scheduled_meetings

  validates :title, presence: true, length: { minimum: 3 }
  validates :meeting_time, presence: true
end
