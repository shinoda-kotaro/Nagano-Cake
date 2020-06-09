class Item < ApplicationRecord
  validates :price, presence: true
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :genre
  attachment :image
end
