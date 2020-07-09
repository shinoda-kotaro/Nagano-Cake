class Order < ApplicationRecord
  enum payment_status: { credit: 0 , bank: 1 }
  belongs_to :end_user
  has_many :order_details
  accepts_nested_attributes_for :order_detail
end
