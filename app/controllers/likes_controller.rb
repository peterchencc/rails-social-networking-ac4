class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:photo_id])
    @like = Like.toggle(@photo, current_user)

    render :action => "toggle_like_button"
  end

end
