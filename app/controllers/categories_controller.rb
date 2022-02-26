class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
    

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  private
    
    def not_found
      render :not_found, 
        status: :not_found
    end 

end
