class CommentsController < ApplicationController
  def new
    event = Event.find(params[:event_id])
    @comment = event.comments.new
    p event.comments
  end

  def create
    @comment = Comment.create(params.require(:comment).permit(:body))
    redirect_to '/'
  end
end
