class Item < ApplicationRecord
  validates :price, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :is_sale, inclusion: { in: [true, false] }

  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  attachment :image

  def self.search(search)
    if search
      Item.where(['name LIKE ?', "%#{search}%"])
    else
      Item.all
    end
  end

end
