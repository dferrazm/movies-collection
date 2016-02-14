class Movie < ActiveRecord::Base
  belongs_to :user

  validates :user, :name, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end
