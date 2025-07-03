class Admin::PostsController < ApplicationController
  before_action :set_post, except: [ :new, :create ]

  def show; end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(params.require(:post).permit(:title, :body))
      redirect_to [ :admin, @post ]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(params.require(:post).permit(:title, :body))
      redirect_to [ :admin, @post ]
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to admin_root_path
    else
      render :show
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
