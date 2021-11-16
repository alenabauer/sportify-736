CATEGORIES = ['climbing', 'cycling', 'golf', 'snow sports', 'aquatic sports', 'ball games']

class Offer < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true
  validates :equipment_type, presence: true
  validates :equipment_category, presence: true, inclusion: { in: CATEGORIES }
end
