class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token



  def create
    @order = current_order
    @order.user = current_user
    @order_item = @order.order_items.new(order_params)
    @order_item.order_id = @order.id # Assign order ID to the order item
    @order.save
    session[:order_id] = @order.id
    # byebug
    render json: { message: 'Order item was successfully created.' }, status: :created  
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_params)
    @order_items = current_order.order_items
    render json: { message: 'Order item was successfully updated.' }, status: :ok
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
    render json: { message: 'Order item was successfully removed.' }, status: :no_content
  end

  # find order items for a particular user for order history
  def user_order_items
    @order_items = current_user.orders.includes(:order_items).flat_map(&:order_items)
  end


  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end




# post for create 3000/order_items
# {
#   "order_item": {
#     "quantity": 2,
#     "product_id": 6,
#     "order_id": 2,
#     "total":400,
#     "unit_price": 200
#   }
# }

# patch/put for update 3000/order_items/1


# get for retrieve all 3000/products
# get for retrieve details of specific product 3000/products/id
# post for create a new product  3000/products 
# {
#   "product": {
#     "title": "New Product",
#     "price": 9.99
#   }
# }

# put/patch for update product/id
# delete for delete  products/id 
