CATEGORIES = ['climbing', 'cycling', 'snow sports', 'water sports', 'ball games']

class Offer < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, presence: true
  validates :price, presence: true
  validates :equipment_type, presence: true
  validates :equipment_category, presence: true, inclusion: { in: CATEGORIES }
end
