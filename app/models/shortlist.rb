class Shortlist < ApplicationRecord
  belongs_to :user
  has_many :session_gifts, dependent: :destroy
  has_many :gifts, through: :session_gifts
  validates :recipient_name, presence: :true
  validate :inclusion_in_categories

  def inclusion_in_categories
    if interest == "[\"\"]"
      errors.add(:interest, "can't be blank")
    end
  end

  CATEGORIES = [
    "Pet Supplies",
    "Clothing",
    "Home & Living",
    "Jewelry",
    "Art & Collectibles",
    "Bags & Purses",
    "Craft Supplies & Tools",
    "Electronics & Accessories",
    "Accessories",
    "Books, Movies & Music",
    "Weddings",
    "Shoes",
    "Toys & Games",
    "Bath & Beauty",
    "Paper & Party Supplies"
    ]
end
