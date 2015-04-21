class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [ :create, :update, :destroy]


  def create

    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save

      redirect_to photo_path(@photo)
    else
      render :template => "photos/show"
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

end
