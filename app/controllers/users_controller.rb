class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
  end

  def category
    @category = Category.find(params[:id])
    render template: 'users/genres'
  end

  private

    def not_found
      render :not_found, 
        status: :not_found
    end 

end
