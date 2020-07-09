class Order < ApplicationRecord
  enum payment_status: { credit: 0 , bank: 1 }

  validates :payment_status, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :total_price, presence: true

  belongs_to :end_user
  has_many :order_details
  accepts_nested_attributes_for :order_details
end