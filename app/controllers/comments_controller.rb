class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [ :create, :update, :destroy]

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user

    @comment.save
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.find( params[:id] )

    if @comment.can_delete_by?(current_user)
      @comment.destroy
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

end
