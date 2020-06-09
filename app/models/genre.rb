class Genre < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :is_effective, inclusion: { in: [true, false] }
  has_many :items
end
