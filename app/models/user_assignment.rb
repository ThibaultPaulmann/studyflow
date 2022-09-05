class UserAssignment < ApplicationRecord
  PROGRESS = ["Not started", "Working", "Completed"]
  DIFFICULTIES = {
    1 => "Easy",
    2 => "Medium",
    3 => "Hard",
    4 => "Expert"
  }

  belongs_to :assignment
  belongs_to :user

  validates :user_progress, presence: true, inclusion: { in: PROGRESS}
end
