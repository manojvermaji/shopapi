class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  def index
    @products = Product.all
    render json: @products
  end

  def show
    render json: @product
  end

  def new
    @product = Product.new
  end

  def edit; end


  def create
    @product = Product.new(product_params)
      if @product.save
        render json: @product, status: :created
            else
        render json: @product.errors, status: :unprocessable_entity 
      end
  end

  def update
    @product = Product.find(params[:id]) 

      if @product.update(product_params)
        render json:@product, status: :ok
      else
        render json: @product.errors, status: :unprocessable_entity      end
  end

  def destroy
    @product.destroy
    render json: { message: 'Product was successfully destroyed.' }, status: :no_content
  end

  private
    
  def set_product
    @product = Product.find(params[:id])
  end


    def product_params
      params.require(:product).permit(:title, :price)
    end
end





# get for retrieve all 3000/products
# get for retrieve details of specific product 3000/products/id
# post for create a new product  3000/products 
# 
# ye body k andr raw me likhna h
# {
#   "product": {
#     "title": "New Product",
#     "price": 9.99
#   }
# }

# put/patch for update product/id
# delete for delete  products/id 
