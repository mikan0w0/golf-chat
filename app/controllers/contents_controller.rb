class ContentsController < ApplicationController
  before_action :move_to_home, except: [:index, :show]

  def index
    @category = Category.find(params[:category_id])
    @contents = Content.where(category_id: params[:category_id])
    @content = Content.new
  end

  def create
    @category = Category.find(params[:category_id])
    @content = @category.contents.new(content_params)
    if @content.valid?
      @content.save
      redirect_to action: :index
    else
      redirect_to root_path
    end
  end

  def show
    @content = Content.find(params[:id])
    @category = Category.find(params[:category_id])
    @comments = Comment.where(content_id: params[:id])
    @comment = Comment.new
  end

  private

  def move_to_home
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def content_params
    params.require(:content).permit(:content, :category_id).merge(user_id: current_user.id)
  end

end