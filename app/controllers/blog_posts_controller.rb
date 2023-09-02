class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog_post, except: [:index, :new, :create]
  before_action :validate_post_owner, only: [:edit, :update, :delete]

  def index
    @blog_posts = BlogPost.all
  end

  def show;end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.user = current_user
    if @blog_post.save
      flash[:alert] = "You have successfully create a Post"
      redirect_to root_path
    else
      flash[:notice] = "Failed to create a Post"
      render :new
    end
  end

  def edit;end

  def update
    if @blog_post.update(blog_post_params)
      flash[:alert] = "You have successfully updated a Post"
      redirect_to root_path
    else
      flash[:notice] = "Failed to update a Post"
      render :edit
    end
  end

  def destroy
    if @blog_post.destroy
      flash[:alert] = "Deleted successfully"
    else
      flash[:notice] = "Failed to delete a Post"
    end
    redirect_to root_path
  end

  private

  def validate_post_owner
    unless @blog_post.user == current_user
      flash[:notice] = 'the post not belongs to you'
      redirect_to root_path
    end
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :content)
  end
end
