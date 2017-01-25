class CommentsController < ApplicationController
  def new
    event = Event.find(params[:event_id])
    @comment = event.comments.new
  end

  def create
    @event = Event.find(params[:event_id])
    @event.comments.create(comment_params)
    redirect_to "/"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
