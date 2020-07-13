class Order < ApplicationRecord
  enum payment_status: { credit: 0 , bank: 1 }
  enum order_status: { waiting_for_payment: 0 , confirmed_payment: 1 , in_production: 2 , preparing_for_shipping: 3 , sent: 4 }

  validates :postcode, presence: true, length: { minimum: 1 }
  validates :address, presence: true, length: { minimum: 1 }
  validates :name, presence: true, length: { minimum: 1 }
  validates :total_price, presence: true, numericality: { only_integer: true, greater_than: 0}

  belongs_to :end_user
  has_many :order_details
  accepts_nested_attributes_for :order_details
end