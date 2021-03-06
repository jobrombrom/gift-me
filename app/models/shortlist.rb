class Shortlist < ApplicationRecord
  belongs_to :user
  has_many :session_gifts
  has_many :gifts, through: :session_gifts

  # validates :interest, inclusion: { in: [
  #   "Pet Supplies",
  #   "Clothing",
  #   "Home & Living",
  #   "Jewelry",
  #   "Art & Collectibles",
  #   "Bags & Purses",
  #   "Craft Supplies & Tools",
  #   "Electronics & Accessories",
  #   "Accessories",
  #   "Books, Movies & Music",
  #   "Weddings",
  #   "Shoes",
  #   "Toys & Games",
  #   "Bath & Beauty",
  #   "Paper & Party Supplies"
  # ] }
end
