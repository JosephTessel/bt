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

    if @review.save
      # ReviewNotifier.new_review(@review).deliver_later
      flash[:alert] = "Review saved"
      redirect_to design_path(params[:design_id])
    else
      flash.now[:alert] = @review.errors.full_messages.join(". ")
      render "designs/show"
    end
  end

  def destroy
    @design = Design.find(params[:design_id])
    @review = Review.find(params[:id])
    if current_user != nil
      unless @review.user != current_user || current_user.role != "admin"
        redirect_to designs_path
        flash[:notice] = "You can't destroy other people's reviews!"
      end
    end

    @deletereview = Review.find(params[:id]).destroy
    flash[:notice] = "Review Deleted"
    redirect_to design_path(@design)
  end

  protected

  def review_params
    params.require(:review).permit(:body, :design_id)
  end
end
