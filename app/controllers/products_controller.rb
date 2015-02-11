class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def show
    @products = Product.find(params[:id])

  end

  def new
  	@product = Product.new
  	
  end

  def create
    @product = Product.new(product_params)
  	if @product.save
  		redirect_to  root_path, notice: "Successfully created a Product"
  	end
  end
  

  def edit
    @product = Product.find(params[:id])
  end

  def update
  		@product = Product.find(params[:id])
    	if @product.update!(product_params)
    	 redirect_to root_path, notice: "Successfully Updated a Product"
      end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_url, notice: "Product Destruction Completed"

  end
  def product_params    
    params.require(:product).permit(:name,:description, :price, :published)
  end



end
