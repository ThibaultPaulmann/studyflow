class Question < ApplicationRecord
  belongs_to :assignment
  belongs_to :user

  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :upvotes, presence: true, numericality: { only_integer: true }
end
