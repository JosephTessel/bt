class DesignsController < ApplicationController
  def index
    @designs = Design.all
  end

  def new
    @design = Design.new
  end

  def show
    @design = Design.find(params[:id])
    @reviews = @design.reviews.order(created_at: :desc).page(params[:page])
    @review = Review.new
    @vote_total = Vote.group(:review_id).sum(:vote)
  end

  def create
    @design = Design.new(design_params)
    @design.user = current_user
      if @design.save
       flash[:notice] = "Design Submitted!"
       redirect_to designs_path
      else
       render :new
      end
  end


  # def show
  #   @design = Design.find(params[:id])
  #   @reviews = @design.reviews.order(created_at: :desc)
  # end
  #
  # def new
  #   @design = Design.new
  # end
  #
  # def create
  #   @design = Design.new(design_params)
  #   @design.user = current_user
  #
  #   if @design.save
  #     flash[:notice] = "Design Submitted!"
  #     redirect_to designs_path
  #   else
  #     render :new
  #   end
  # end
  #
  # def destroy
  #   @design = Design.find(params[:id]).destroy
  #   flash[:notice] = "Design Deleted"
  #   redirect_to designs_path
  # end

  protected

  def design_params
    params.require(:design).permit(:design_name, :description, :user_id, :design_image)
  end
end
