class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, dependent: :destroy

  validates :user, :name, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  def main_picture
    pictures.first
  end

  def main_picture_url
    main_picture.try(:url)
  end

  def add_picture(params)
    pictures.create(params)
  end

  def remove_picture(picture_id)
    pictures.find(picture_id).destroy
  end
end
