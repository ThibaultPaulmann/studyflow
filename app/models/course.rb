class Course < ApplicationRecord
  before_save :create_shareCode
  has_many :course_enrollments, dependent: :destroy
  has_many :users, through: :course_enrollments
  has_many :assignments, dependent: :destroy
  has_many :useful_resources, dependent: :destroy

  validates :code, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 17 }

  private

  def create_shareCode
    self.shareCode = DateTime.now.strftime("%Y%m%d%k%M%S%L").to_i.to_s(36)
  end 
end
