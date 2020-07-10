require 'pry'
class CommentsController < ApplicationController
    before_action :get_comment, only: [:edit, :update, :destroy]
    before_action :set_comments, only: [:edit, :update, :destroy]

    def new
        @comment = Comment.new 
    end 

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.review_id = params[:review_id]
        @comment.save
        redirect_to review_path(@comment.review)
    end

    def edit
    end 

    def update
        @comment.update(comment_params)
        redirect_to review_path(@review)
    end 
  
    def destroy
        @comment.destroy
        redirect_to review_path(@review)
    end

    private

    def get_comment
        @comment = Comment.find_by(id: params[:id])
    end 

    def set_comments
        @review = @comment.review 
        @comments = @review.comments.find_by(id: params[:id])
    end 
        
    def comment_params
        params.require(:comment).permit(:content, :review_id)
    end 

end
