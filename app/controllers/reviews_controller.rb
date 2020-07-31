require 'pry'
class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :authorize!, only: [:edit, :destroy]
    
    def index
      if params[:search]
        @reviews = Review.where("title like ?", "%#{params[:search]}%") 
      else
        @reviews = Review.all
      end
    end
  
    def new
      @review = Review.new
      @comment = Comment.new
      @comment.review_id = @review.id 
      #We need to declare the comments in the new action. 
    end
  
    def create
      @review = current_user.reviews.new(review_params)

      if @review.save
        redirect_to review_path(@review)
      else
        render 'new'
      end
    end
  
    def show
      @comment = Comment.new 
      #We also need to declare the new comment in the show action. 
    end
  
    def edit
    end
  
    def update
      if @review.update(review_params)
        redirect_to review_path(@review)
      else  
        render 'edit'
      end  
    end
  
    def destroy
      @review.destroy
      redirect_to reviews_path   
    end
  
    private

      def set_review
        @review = Review.find_by(id: params[:id])
    end 
  
      def review_params
        params.require(:review).permit(:title, :content, :category_id, :search)
      end

      def authorize! 
        authorize @review #authorize method using the Pundit gem
    end 
end
