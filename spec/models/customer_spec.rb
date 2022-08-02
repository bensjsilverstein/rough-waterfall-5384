require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items}
    it { should have_many(:items).through(:customer_items)}
  end

  describe 'model methods' do
    it "#total_price" do
      supermarket_1 = Supermarket.create!(name: "King Soopers", location: "North Denver")
      ben = supermarket_1.customers.create!(name: "Ben S")
      milk = Item.create!(name: "Milk", price: 3)
      eggs = Item.create!(name: "Eggs", price: 4)
      bread = Item.create!(name: "Bread", price: 5)

      CustomerItem.create!(customer_id: ben.id, item_id: milk.id)
      CustomerItem.create!(customer_id: ben.id, item_id: eggs.id)
      CustomerItem.create!(customer_id: ben.id, item_id: bread.id)

      expect(ben.total_price).to eq(12)
    end
  end
end
