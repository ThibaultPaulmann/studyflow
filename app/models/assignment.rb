class Assignment < ApplicationRecord
  belongs_to :course

  has_many :questions, dependent: :destroy
  has_many :user_assignments, dependent: :destroy
  has_many :users, through: :user_assignments
  has_many :study_sessions, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  validates :due_date, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 43 }
end
