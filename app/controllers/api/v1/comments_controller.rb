class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

 def index
    render json: Event.find(params[:event_id]).comments
  end

  def create
    event = Event.find(params[:event_id])
    comment = event.comments.new(comment_params)
    comment.save!
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
