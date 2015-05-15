class ReviewsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    @review = Review.new(review_params)
    if @review.save
      render :json => {:message => "Review is created.", :review => @review.as_json}, :status => :created
    else
      render :json => { error: @review.errors.as_json}, :status => "401"
    end
  end

  def show
    set_review
    if @review
      render :json => {:review => @review.as_json}, :status => :created
    else
      render json: { error: "Review not Found"}, :status => "401"
    end
  end


  private

  def review_params
    params.require(:review).permit!
  end

  def set_review
    @review = Review.where(id: params[:id]).first
  end

end
