class Info < ApplicationRecord
  belongs_to :plant
  belongs_to :seed_share
  belongs_to :wishlist
  validates :primaryCommonName, presence: true
end
