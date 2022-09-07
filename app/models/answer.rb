class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  acts_as_votable

  validates :content, presence: true, length: { minimum: 2 }
  validates :upvotes, numericality: { only_integer: true }
end
