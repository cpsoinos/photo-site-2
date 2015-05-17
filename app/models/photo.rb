class Photo < ActiveRecord::Base
  belongs_to :category
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :category, presence: true
end
