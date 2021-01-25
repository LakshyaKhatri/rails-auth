class ItemsController < ApplicationController
  before_action :require_login

  def new
    category = Category.first
    category_id = category.id if category.present?

    @item = Item.new(category_id: category_id )
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to admin_dashboard_url
    else
      render :new
    end
  end

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
