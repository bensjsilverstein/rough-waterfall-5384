class Item < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :price

  has_many :customer_items
  has_many :customers, through: :customer_items
end
