require 'pry'
class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    
    def index
      @reviews = Review.all
    end
  
    def new
      @review = Review.new
    end
  
    def create
      @review = Review.new(review_params)
      @review.user_id = current_user.id
      if @review.save
        redirect_to review_path(@review)
      else
        render 'new' 
      end
    end
  
    def show
    end
  
    def edit
       authorize @review
    end
  
    def update
      if @review.update(review_params)
        redirect_to review_path(@review)
      else  
        render 'edit'
      end  
    end
  
    def destroy
      authorize @review
      @review.destroy
      redirect_to reviews_path   
    end
  
    private
  
      def set_review
        @review = Review.find_by(id: params[:id])
      end 
  
      def review_params
        params.require(:review).permit(:title, :content, :category_id)
      end
end
