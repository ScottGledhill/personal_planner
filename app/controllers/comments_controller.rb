class CommentsController < ApplicationController
  def new
    event = Event.find(params[:event_id])
    @comment = event.comments.new
  end

  def create
    event = Event.find(params[:event_id])
    comment = event.comments.new(comment_params)
    comment.user_id = current_user.id
    if comment.save!
      redirect_to event_path(event)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    if current_user != @comment.user
      flash[:notice] = 'Can only edit comments you created'
      redirect_to event_path(comment.event)
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      redirect_to event_path(comment.event)
    else
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if current_user == comment.user
      comment.destroy
    else
      flash[:notice] = 'Can\'t delete other peoples comments'
    end
    redirect_to event_path(comment.event)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
