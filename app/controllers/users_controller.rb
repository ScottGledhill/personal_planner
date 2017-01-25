class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user.attendances.events
  end
end
