class ReviewsController < ApplicationController

before_action :authorize

def new
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id].to_i)
    rating = params[:review][:rating]
    description = params[:review][:description]
    if rating && description
      @review = Review.new(product_id: @product.id, user_id: current_user.id, rating: rating.to_i, description: description)
      @review.save
      if @review.save
        flash[:notice] = "Your review has been submitted successfully"
        redirect_to @product
      else
        flash[:alert] = "You must enter some details!"
        redirect_to :back
      end
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Your review was deleted successfully."
      redirect_to @product
    else
      flash[:error] = "There was an error deleteing the purchase."
      render :show
    end
  end

  private

  def reviews_params
    params.permit(
      :description,
      :rating,
      :product_id,
      :user_id
    )
  end
end
