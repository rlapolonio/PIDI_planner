class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @categories = Category.all
    @categories = current_user.categories.all 
  end

  def new
    # @category = Category.new
    @category = current_user.categories.build
  end

  def create
    # @category = Category.create(category_params)
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_path, notice: "Category was created successfully."
    else
      render :new
    end
  end

  def show
    # @category = Category.find(params[:id])
    @category = current_user.categories.find(params[:id])
  end

  def edit
    # @category = Category.find(params[:id])
    @category = current_user.categories.find(params[:id])
  end

  def update
    # @category = Category.find(params[:id])
    @category = current_user.categories.find(params[:id])

    if @category.update(category_params)
      redirect_to category_tasks_path(@category), notice: "Category was updated successfully."
    else
      render :edit
    end
  end

  def destroy
    # @category = Category.find(params[:id])
    @category = current_user.categories.find(params[:id])
    @category.destroy

    redirect_to categories_path, notice: "Category was deleted successfully."
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :user_id)
  end
end
