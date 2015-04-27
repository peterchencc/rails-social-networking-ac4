class PhotosController < ApplicationController

  before_action :authenticate_user!, :only => [ :create, :update, :destroy]

  def index
    @photos = Photo.all.order("created_at DESC")
    @photo = Photo.new
    @comment = Comment.new
  end

  def show
    @photo = Photo.find( params[:id] )
    @comment = Comment.new
  end

  def create

    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if @photo.save
      flash[:notice] = "新增成功"
      redirect_to photos_path
    else
      @photos = Photo.all.order("created_at DESC")
      @photo = Photo.new
      @comment = Comment.new
      render :action => :index
    end
  end

  def destroy
    @photo = Photo.find( params[:id] )

    if @photo.can_delete_by?(current_user)
      @photo.destroy
    end

    respond_to do |format|
      # format.html { redirect_to :back }
      format.js
    end
  end

  def tagged_photos
    @tag = Tag.find_by_name(params[:id])
    @photos = @tag.photos
    respond_to do |format|
      format.js{
        render :template => "photos/show_tagged_photos"
      }
    end

  end

  protected

  def photo_params
    params.require(:photo).permit( :content, :avatar, :tag_list )
  end
end
