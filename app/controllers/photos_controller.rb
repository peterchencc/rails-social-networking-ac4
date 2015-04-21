class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order("created_at DESC")
    @photo = Photo.new
  end

  def create

    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if @photo.save
      flash[:notice] = "新增成功"
      redirect_to photos_path
    else
      render :action => :index
    end
  end


  protected

  def photo_params
    params.require(:photo).permit( :content, :avatar )
  end
end
