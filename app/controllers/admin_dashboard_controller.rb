class AdminDashboardController < ApplicationController
  before_action :require_login

  def index
    @item_count = Item.count()
    @category_count = Category.count()
    @types_of_tax_count = Tax.count()
  end
end
