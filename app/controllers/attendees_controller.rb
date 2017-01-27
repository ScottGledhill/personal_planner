class AttendeesController < ApplicationController
    def show
      if user_signed_in?
        @user = User.find(params[:id])
        @user.attendances.events
      end
    end
  end
end
