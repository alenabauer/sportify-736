class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :offers

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
