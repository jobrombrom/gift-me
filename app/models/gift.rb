class Gift < ApplicationRecord
    validates :title, presence: true, uniqueness: true
end
