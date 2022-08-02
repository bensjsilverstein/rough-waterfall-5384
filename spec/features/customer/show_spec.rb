require 'rails_helper'

RSpec.describe 'customer show page' do
  it "has a list of all the customer's items and their supermarket" do
    supermarket_1 = Supermarket.create!(name: "King Soopers", location: "North Denver")
    supermarket_2 = Supermarket.create!(name: "Queen Soopers", location: "North Denver")
    ben = supermarket_1.customers.create!(name: "Ben S")
    milk = Item.create!(name: "Milk", price: 3)
    eggs = Item.create!(name: "Eggs", price: 4)
    bread = Item.create!(name: "Bread", price: 5)
    soup = Item.create!(name: "Soup", price: 100)

    CustomerItem.create!(customer_id: ben.id, item_id: milk.id)
    CustomerItem.create!(customer_id: ben.id, item_id: eggs.id)
    CustomerItem.create!(customer_id: ben.id, item_id: bread.id)

    visit("/customers/#{ben.id}")

    expect(page).to have_content("King Soopers")
    expect(page).to_not have_content("Queen Soopers")
    expect(page).to have_content("Milk")
    expect(page).to have_content("Eggs")
    expect(page).to have_content("Bread")
    expect(page).to_not have_content("Soup")
  end

  it "displays the total price of the customer's items" do
    supermarket_1 = Supermarket.create!(name: "King Soopers", location: "North Denver")
    supermarket_2 = Supermarket.create!(name: "Queen Soopers", location: "North Denver")
    ben = supermarket_1.customers.create!(name: "Ben S")
    milk = Item.create!(name: "Milk", price: 3)
    eggs = Item.create!(name: "Eggs", price: 4)
    bread = Item.create!(name: "Bread", price: 5)
    soup = Item.create!(name: "Soup", price: 100)

    CustomerItem.create!(customer_id: ben.id, item_id: milk.id)
    CustomerItem.create!(customer_id: ben.id, item_id: eggs.id)
    CustomerItem.create!(customer_id: ben.id, item_id: bread.id)

    visit("/customers/#{ben.id}")

    expect(page).to have_content("Total Price: $12")
    expect(page).to_not have_content("Total Price: $112")
  end

end
