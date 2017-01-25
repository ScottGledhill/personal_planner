class CommentsController < ApplicationController
  def new
    event = Event.find(params[:event_id])
    @comment = event.comments.new
  end

  def create
    event = Event.find(params[:event_id])
    @comment = event.comments.new(comment_params)
    if @comment.save
      redirect_to "/"
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
