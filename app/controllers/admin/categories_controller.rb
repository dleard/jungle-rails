class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with :name => ENV['ADMIN_USER'], :password => ENV['ADMIN_PASS'] 

    
  def index
    @categories = Category.all()
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Product deleted!'
  end

end
