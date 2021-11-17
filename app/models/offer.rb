CATEGORIES = ['Climbing', 'Cycling', 'Snow sports', 'Water sports', 'Ball games']

class Offer < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, presence: true
  validates :price, presence: true
  validates :equipment_type, presence: true
  validates :equipment_category, presence: true, inclusion: { in: CATEGORIES }
end
