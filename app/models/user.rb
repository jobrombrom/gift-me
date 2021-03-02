class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shortlists
  validates :email, presence: true
  # can't really add below due to seed file formatting not really a big deal
  # , uniqueness: true 
end
