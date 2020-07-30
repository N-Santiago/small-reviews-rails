class UsersController < ApplicationController
  
  def index
    @users = User.all 
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def category
    @category = Category.find(params[:id])
    render template: 'users/genres'
  end

end
