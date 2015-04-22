class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [ :create, :update, :destroy]


  def create

    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save

      # respond_to do |format|

      #   format.js
      # end

      redirect_to photos_path
    else
      render :template => "photos/show"
    end
  end

  def destroy

    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.find( params[:id] )

    if @comment.can_delete_by?(current_user)
      @comment.destroy
    end

    respond_to do |format|

      format.js
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

end
