class CommentsController < ApplicationController
  def new
    event = Event.find(params[:event_id])
    @comment = event.comments.new
  end

  def create
    event = Event.find(params[:event_id])
    @comment = event.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save!
      redirect_to event_path(event)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
