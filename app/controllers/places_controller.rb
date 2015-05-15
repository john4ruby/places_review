class PlacesController < ApplicationController

  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    @place = Place.new(place_params)
    if @place.save
      render json: {message: "Place is created.", place: @place.as_json}, status: :created
    else
      render json: { error: @place.errors.as_json}, status: "401"
    end
  end

  def get_reviews
    set_place
    render json: {:place => @place.as_json, reviews: @place.reviews.as_json }
  end

  def get_reviews_by_gid
    get_place_by_gid
    render json: {:place => @place.as_json, reviews: @place.reviews.as_json }
  end


  private

  def place_params
    params.require(:place).permit!
  end

  def set_place
    @place = Place.where(id: params[:id]).first
  end

  def get_place_by_gid
    @place = Place.where(google_id: params[:google_id]).first
  end

end
