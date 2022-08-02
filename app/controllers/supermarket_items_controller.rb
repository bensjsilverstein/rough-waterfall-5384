class SupermarketItemsController < ApplicationController
  def index
    @supermarket = Supermarket.find(params[:id])
    @supermarket_items = @supermarket.unique_items
  end
end
