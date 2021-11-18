class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :offers
  has_many :reservations
  has_many :reservations_as_owner, through: :offers, source: :reservations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def reservation_for(offer)
    Reservation.find_by(user: self, offer: offer)
  end
end
