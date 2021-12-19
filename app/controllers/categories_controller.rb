class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @group_categories = @categories.group_by{|cate|cate.parent_cate_id}
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    @option_parent_category = option_parent_category
  end

  def create
    @category = Category.new(category_params)
    @option_parent_category = option_parent_category

    if @category.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    @option_parent_category = option_parent_category
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to action: "index"
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    Category.where(parent_cate_id: params[:id]).destroy_all
  
    redirect_to action: "index"
  end

  private
  def option_parent_category
    Category.where(parent_cate_id:[nil,true]).collect{ |p| [ p.name, p.id ] }
  end


  private
    def category_params
      params.require(:category).permit(:name, :parent_cate_id)
    end
end
