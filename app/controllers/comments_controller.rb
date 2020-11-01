class CommentsController < ApplicationController
  before_action :move_to_home, except: [:index, :show]

  def create
    @category = Category.find(params[:category_id])
    @content = Content.find(params[:content_id])
    @comment = @content.comments.new(comment_params)
    if @comment.valid?
      @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
      # redirect_to category_content_path(@category, @content)
    else
      render "@content/show"
    end
  end

  private

  def move_to_home
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def comment_params
    params.require(:comment).permit(:comment, :content_id).merge(user_id: current_user.id)
  end

end
