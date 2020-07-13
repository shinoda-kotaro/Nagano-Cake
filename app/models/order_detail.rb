class OrderDetail < ApplicationRecord

  validates :price, presence: true , numericality: { only_integer: true, greater_than: 0}
  validates :amount, presence: true , numericality: { only_integer: true, greater_than: 0}

  belongs_to :order
  belongs_to :item
end