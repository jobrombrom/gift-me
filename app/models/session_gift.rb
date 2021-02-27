class SessionGift < ApplicationRecord
  belongs_to :gift
  belongs_to :shortlist
end
