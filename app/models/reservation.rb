class Reservation < ApplicationRecord
  # belongs_to :asker, class_name: "User"
  # belongs_to :receiver, class_name: "User"
  belongs_to :user
  belongs_to :offer

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date?

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end
end
