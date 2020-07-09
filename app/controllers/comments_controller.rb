require 'pry'
class CommentsController < ApplicationController
    before_action :set_comments, only: [:show, :edit, :update, :destroy]

    def show
    end 

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
        @comment = @review.comments.update(comment_params)
        redirect_to review_path(@review.comments)
    end 
  
    def destroy
        @comment.destroy
        redirect_to post_path(@post)
    end

    private

    def set_comments
        @comment = @review.comments.find(params[:id])
    end 

    def comment_params
        params.require(:comment).permit(:content, :review_id)
    end 

end
