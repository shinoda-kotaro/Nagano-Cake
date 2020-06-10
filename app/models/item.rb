class Item < ApplicationRecord
  validates :price, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :is_sale, inclusion: { in: [true, false] }

  belongs_to :genre
  attachment :image
end
