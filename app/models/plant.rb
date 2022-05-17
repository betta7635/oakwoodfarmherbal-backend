class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_one :info 
end
