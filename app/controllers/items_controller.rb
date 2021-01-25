class ItemsController < ApplicationController
  def new
    @item = Item.new(category_id: 1)
  end
end
