class CategoriesController < ApplicationController

  def index
    @photos = Photo.all
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @cover_photo = Photo.where(category: @category).to_a.first
    @photos = Photo.where(category: @category).to_a.slice(1..-1)
  end

end
