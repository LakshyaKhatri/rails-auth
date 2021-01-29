module Api
  module V1
    class ItemsController < Api::V1::ApiController

      def list
        @items = Item.find_by_sql(
          "SELECT id, name, taxed_price, is_imported, in_stock, (CASE WHEN EXISTS (SELECT id FROM #{CartItem.table_name}
            WHERE #{CartItem.table_name}.item_id = #{Item.table_name}.id AND
            #{CartItem.table_name}.cart_id = #{session[:cart_id]}
          ) THEN 1 ELSE 0 END) as `in_cart`
          FROM #{Item.table_name}
          WHERE #{Item.table_name}.category_id = #{params[:category]} AND
          #{Item.table_name}.in_stock >= 1
          ORDER BY #{Item.table_name}.name"
        )
        render json: @items
      end
    end
  end
end
