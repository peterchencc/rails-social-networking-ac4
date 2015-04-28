class LikesController < ApplicationController

  before_action :authenticate_user!, :only => [ :create ]

  def create
    @photo = Photo.find(params[:photo_id])
    Like.toggle(@photo, current_user)

    render :action => "toggle_like_button"
  end

end
