class Order < ApplicationRecord
  enum payment_status: { credit: 0 , bank: 1 }
  belongs_to :end_user
end
