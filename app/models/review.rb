class Review < ActiveRecord::Base

  RATINGS = [1,2,3,4,5]
  belongs_to :product
  belongs_to :user

  validates :product, presence: true
  validates :user, presence: true
  validates :rating, presence: true
end
