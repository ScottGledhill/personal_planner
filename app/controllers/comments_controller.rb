class CommentsController < ApplicationController
  def new
    event = Event.find(params[:event_id])
    @comment = event.comments.new
    p event.comments
  end
end
