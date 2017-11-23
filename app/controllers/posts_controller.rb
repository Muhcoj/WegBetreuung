class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index  
    @posts = Post.page(params[:page]).per(3)
   # @posts = Post.order('created_at DESC').limit(3)
  end

  def new
    if admin_types.include?(current_user.type)
      @post = Post.new
    else
      redirect_to posts_path, alert: 'Access denied'
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Nachricht gespeichert"
    else
      render :new
    end
  end

  def show
  end

  def edit 
    authorize @post 
  end

  def update
    authorize @post

    if @post.update(post_params)
      redirect_to @post, notice: 'Ihre Nachricht wurde erfolgreich aktualisiert'
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: 'Ihre Nachricht wurde erfolgreich entfernt'
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :date)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
