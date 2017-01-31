class Api::V1::CommentsController < ApplicationController
  def index
    render json: Event.find(params[:event_id]).comments
  end
end
