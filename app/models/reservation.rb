class Reservation < ApplicationRecord
  # belongs_to :asker, class_name: "User"
  # belongs_to :receiver, class_name: "User"
  belongs_to :user
  belongs_to :offer

  validates :start_date, presence: true
  validates :end_date, presence: true
end
