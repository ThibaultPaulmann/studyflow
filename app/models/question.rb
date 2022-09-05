class Question < ApplicationRecord
  belongs_to :assignment
  belongs_to :user
  acts_as_votable

  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }, uniqueness: false
  validates :upvotes, numericality: { only_integer: true }
end
