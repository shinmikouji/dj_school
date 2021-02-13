class ReviewsController < ApplicationController

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "口コミを投稿しました"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def review_params
      params.require(:review).permit(:content)
    end
end
