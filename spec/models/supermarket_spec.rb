require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :customers }
    it { should have_many(:items).through(:customer_items) }
  end

  describe  'model methods' do
    it "#distinct_items" do
          supermarket_1 = Supermarket.create!(name: "King Soopers", location: "North Denver")
          ben = supermarket_1.customers.create!(name: "Ben S")
          chris = supermarket_1.customers.create!(name: "Chris S")
          milk = Item.create!(name: "Milk", price: 3)
          eggs = Item.create!(name: "Eggs", price: 4)
          bread = Item.create!(name: "Bread", price: 5)
          soup = Item.create!(name: "Soup", price: 100)
          fruit = Item.create!(name: "Fruit", price: 200)
          bad_turkey = Item.create!(name: "Turkey", price: 300)

          CustomerItem.create!(customer_id: ben.id, item_id: milk.id)
          CustomerItem.create!(customer_id: ben.id, item_id: eggs.id)
          CustomerItem.create!(customer_id: ben.id, item_id: bread.id)
          CustomerItem.create!(customer_id: chris.id, item_id: milk.id)
          CustomerItem.create!(customer_id: chris.id, item_id: soup.id)
          CustomerItem.create!(customer_id: chris.id, item_id: fruit.id)

          expect(supermarket_1.unique_items).to eq([milk, eggs, bread, soup, fruit])
    end
  end
end
