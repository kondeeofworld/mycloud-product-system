class ProductsController < ApplicationController
  def index
      @products = Product.joins(:category).paginate(page: params[:page], per_page: 5)
  end
  def show
    @product = Product.find(params[:id])
  end

  def new
      @product = Product.new
      @category = Category.all
  end

  def create
      @product = Product.new(product_params)
     
      if @product.save
        redirect_to action: "index"
      else
        render :new
      end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to action: "index"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to action: "index"
  end
  
  private
      def product_params
        params.require(:product).permit(:name, :category_id)
      end
end
