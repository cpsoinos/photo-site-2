class PhotosController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    @photo = Photo.new
  end

  def create
    @category = Category.find(params[:category_id])
    images = photo_params
    images.each do |image|
      photo = @category.photos.new(image: image)
      photo.name = image.original_filename
      unless photo.save
        render :new
      end
    end
    redirect_to category_path(@category)
  end

  private

  def photo_params
    params[:photo][:image]
    # params.require(:photo).permit(:image)
  end

  def photo_name
    photo_params["image"].original_filename
  end
end
