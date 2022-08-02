class Supermarket < ApplicationRecord
  validates_presence_of :location
  validates_presence_of :name

  has_many :customers
  has_many :customer_items, through: :customers
  has_many :items, through: :customer_items

  def unique_items
    items.distinct
  end
end
