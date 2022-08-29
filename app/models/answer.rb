class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  
  validates :content, presence: true, length: { minimum: 2 }
  validates :upvotes, presence: true, numericality: { only_integer: true }
end
