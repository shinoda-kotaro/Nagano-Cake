class Order < ApplicationRecord
  enum payment_status: { credit: 0 , bank: 1 }
end
