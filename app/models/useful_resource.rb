class UsefulResource < ApplicationRecord
  belongs_to :course

  validates :name, presence: true, uniqueness: { scope: :course }, length: { minimum: 2, maximum: 25 }
  validates :link, presence: true, uniqueness: { scope: :course }
end
