class Assignment < ApplicationRecord
  belongs_to :course

  has_many :questions, dependent: :destroy
  has_many :user_assignments, dependent: :destroy
  has_many :users, through: :user_assignments

  validates :due_date, presence: true
  validates :title, presence: true, length: { minimum: 3 }, uniqueness: true

end
