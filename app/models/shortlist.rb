class Shortlist < ApplicationRecord
  belongs_to :recipients
  belongs_to :users
end
