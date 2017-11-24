class ReviewsController < ApplicationController
  before_action :set_cocktail, only: [ :index, :new, :create ]

  def index
    @reviews = @cocktail.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.cocktail = @cocktail
    if @review.save
    redirect_to @cocktail
    else
      render new
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:title, :content, :rating)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
