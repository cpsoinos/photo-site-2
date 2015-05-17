class PhotosController < ApplicationController

  def index
    @photos = Photo.all
    @categories = Category.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(name: photo_name)
    binding.pry
    if @photo.save
      flash[:notice] = "Photo uploaded!"
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:category_id, :image)
  end

  def photo_name
    photo_params["image"].original_filename
  end
end
