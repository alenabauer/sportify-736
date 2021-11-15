class Offer < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :equipment_type, presence: true
  validates :price, presence: true
end
