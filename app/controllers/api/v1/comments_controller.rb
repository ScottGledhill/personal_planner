class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :forbidden_unless_api_key

 def index
    render json: Event.find(params[:event_id]).comments
  end

  def create
    event = Event.find(params[:event_id])
    comment = event.comments.new(comment_params)
    comment.save!
  end

  private

  def forbidden_unless_api_key
    return head status: :forbidden unless has_valid_api_key?
  end

  def has_valid_api_key?
    request.headers['X-Api-Key'] == AUTH_DETAILS["api_key"]
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
