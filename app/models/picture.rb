class Picture < ActiveRecord::Base
  belongs_to :movie
  mount_uploader :image, ImageUploader

  validates :movie, :image, presence: true

  def url
    image.try(:url)
  end
end
