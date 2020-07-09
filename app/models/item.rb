class Item < ApplicationRecord
  validates :price, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :is_sale, inclusion: { in: [true, false] }

  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  attachment :image
end
