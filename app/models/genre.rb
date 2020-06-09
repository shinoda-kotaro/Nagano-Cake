class Genre < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :is_effective, presence: true
  has_many :items
end
