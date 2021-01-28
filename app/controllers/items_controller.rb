class ItemsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    category = Category.first
    category_id = category.id if category.present?

    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # @item.calculate_tax

    if @item.save
      redirect_to admin_dashboard_url
    else
      render :new
    end
  end

  def index
  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :price,
      :in_stock,
      :is_imported,
      :category_id,
      tax_ids: []
    )
  end
end
