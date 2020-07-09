class CommentsController < ApplicationController
    before_action :set_review, only: [:show, :new, :create, :edit, :update, :destroy]
    before_action :set_comments, only: [:show, :edit, :update, :destroy]

    def show
    end 

    def new
    end 

    def create
        @comment = @review.comments.create(comment_params)
        redirect_to post_path(@post)    
    end

    def edit
    end 

    def update
        @comment = @review.comments.create(comment_params)
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
        params.require[:comment].permit(:content)
    end 

end
