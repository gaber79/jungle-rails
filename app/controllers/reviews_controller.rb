class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user = current_user
      if @review.save
        redirect_to product_path(@product)
      else
        render :product
      end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end

    def require_login
      unless current_user
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_path
    end
  end
end
