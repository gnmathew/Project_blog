class FeedbacksController < ApplicationController
  before_action :set_feedback, except:[:index, :new, :create]
  before_action :set_post

  def index
    @feedbacks = @blog_post.feedbacks.includes(:user)
  end

  def new
    @feedback = @blog_post.feedbacks.new
  end

  def create
    @feedback = @blog_post.feedbacks.new(feedback_params)
    @feedback.user = current_user
    if @feedback.save
      flash[:alert] = "You have successfully created Feedback"
      redirect_to @blog_post
    else
      flash[:notice] = "Failed to create a Feedback"
      render :new
    end
  end

  def edit;end

  def update
    if @feedback.update(feedback_params)
      flash[:alert] = "You have successfully updated a Feedback"
      redirect_to @blog_post
    else
      flash[:notice] = "Failed to update a Feedback"
      render :edit
    end
  end

  def destroy
    if @feedback.destroy
      flash[:alert] = "You have successfully deleted a Feedback"
    else
      flash[:notice] = "Failed to delete a Feedback"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def set_post
    @blog_post = BlogPost.find params[:blog_post_id]
  end

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:comment)
  end

end
