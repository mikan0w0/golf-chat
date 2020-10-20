class CategoriesController < ApplicationController
  before_action :move_to_home, except: [:show]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.valid?
      @category.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def move_to_home
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def category_params
    params.require(:category).permit(:name).merge(user_id: current_user.id)
  end
end