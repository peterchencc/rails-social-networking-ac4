class LikesController < ApplicationController


  before_action :authenticate_user!, :only => [ :create ]

  def create

    @like = Like.find_by_user_id_and_photo_id(current_user.id, params[:photo_id])

    if @like == nil
      @like = Like.new( like_params )
      @like.user = current_user
      @like.save
    else
      @like.destroy
    end

    respond_to do |format|
      # format.html { redirect_to :back }
      format.js { render :action => "toggle_like_button" }
    end
  end


  protected

  def like_params
    params.permit(:photo_id)
  end

end
