class Plan < ApplicationRecord
  belongs_to :user
  has_many :seed_shares
  has_many :plants
  validates :planName, presence: true
  validates :planLocation, presence: true
end
