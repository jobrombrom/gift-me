class SessionGift < ApplicationRecord
  belongs_to :gifts
  belongs_to :shortlists
end
