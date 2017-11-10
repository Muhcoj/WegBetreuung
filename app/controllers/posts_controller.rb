class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :authenticate_user!

  def index  
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :content, :date))

    if @post.save
      redirect_to @post, notice: "Nachricht gespeichert"
    else
      render :new
    end
  end

  def show
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :date)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
