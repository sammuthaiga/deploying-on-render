class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :update, :destroy]

    def index
      @reviews = Review.all
      render json: @reviews
    end
  
    def show
      render json: @review
    end
  
    def create
      @review = Review.new(review_params)
      if @review.save
        render json: @review, status: :created
      else
        render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @review.update(review_params)
        render json: @review
      else
        render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @review.destroy
      render json: { message: 'Review deleted successfully' }
    end
  
    private
  
    def set_review
      @review = Review.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Review not found' }, status: :not_found
    end
  
    def review_params
      params.require(:review).permit(:user_id, :plumber_id, :star_rating, :review_message, :endorsed, :recommended)
    end
end
