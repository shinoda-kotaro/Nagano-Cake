class OrderDetail < ApplicationRecord
  enum production_status: { cannot_start: 0 , awaiting_production: 1 , in_production: 2 , production_completed: 3 }

  validates :price, presence: true , numericality: { only_integer: true, greater_than: 0}
  validates :amount, presence: true , numericality: { only_integer: true, greater_than: 0}

  belongs_to :order
  belongs_to :item
end