class UserAssignment < ApplicationRecord
  PROGRESS = ["Not started", "Working", "Completed"]
  belongs_to :assignment
  belongs_to :user

  validates :user_progress, presence: true, inclusion: { in: PROGRESS}
end
