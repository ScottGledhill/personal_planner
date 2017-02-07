class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  API_KEY = '123'

 def index
    render json: Event.find(params[:event_id]).comments
  end

  def create
    return render plain: 'noooo' unless has_valid_api_key?
    event = Event.find(params[:event_id])
    comment = event.comments.new(comment_params)
    comment.save!
  end

  private

  def has_valid_api_key?
    request.headers['X-Api-Key'] == API_KEY
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
