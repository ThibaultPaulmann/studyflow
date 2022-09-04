class Question < ApplicationRecord
  belongs_to :assignment
  belongs_to :user

  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }, uniqueness: false
  validates :upvotes, numericality: { only_integer: true }

  include PgSearch::Model

  pg_search_scope :search_by_title_and_upvotes,
    against: [ :title, :upvotes ],
    associated_against: {
      answer: [:content]
    },
    using: {
      tsearch: { prefix: true }
    }
end
