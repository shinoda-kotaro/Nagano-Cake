class OrderDetail < ApplicationRecord

  validates :price, presence: true
  validates :production_status, presence: true
  validates :amount, presence: true

  belongs_to :order
  belongs_to :items
end
