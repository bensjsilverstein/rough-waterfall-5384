class Customer < ApplicationRecord
  validates_presence_of :name

  belongs_to :supermarket
  has_many :customer_items
  has_many :items, through: :customer_items

  def total_price
    self.items.sum(:price)
  end
end
