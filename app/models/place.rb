class Place < ActiveRecord::Base
  validates :google_id, :latitude, :longitude, presence: true
  validates :google_id, uniqueness: true

  has_many :reviews, dependent: :destroy
end
