class HomeController < ApplicationController

  def new
    @content = Content.new
  end

  def index
    @categories = Category.all
    @contents = Content.all
  end

end