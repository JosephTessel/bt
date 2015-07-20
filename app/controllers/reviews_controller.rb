class ReviewsController < ApplicationController
  def new
    @design = Design.find(params[:design_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @design = Design.find(params[:design_id])
    @review.design = @design
    @review.user = current_user
    @reviews = @design.reviews.order(created_at: :desc).page(params[:page])
    @vote_total = Vote.group(:review_id).sum(:vote)

    if @review.save
      # ReviewNotifier.new_review(@review).deliver_later
      flash[:notice] = "Review saved"
      redirect_to design_path(params[:design_id])
    else
      flash.now[:alert] = @review.errors.full_messages.join(". ")
      render "designs/show"
    end
  end

  def destroy
    @design = Design.find(params[:design_id])
    @deletereview = Review.find(params[:id]).destroy
    flash[:notice] = "Review Deleted"
    redirect_to design_path(@design)
  end

  protected

  def review_params
    params.require(:review).permit(:body, :design_id)
  end
end
