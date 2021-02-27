class Shortlist < ApplicationRecord
  belongs_to :user
  has_many :session_gifts
  has_many :gifts, through: :session_gifts
end