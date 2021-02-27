class Shortlist < ApplicationRecord
  belongs_to :recipient
  belongs_to :user
  has_many :gifts, through: :session_gifts
end
