class DesignsController < ApplicationController
  def index
    @designs = Design.all
  end

  def new
    if current_user == nil
      redirect_to new_user_session_path
    end
    @design = Design.new
  end

  def show
    @design = Design.find(params[:id])
    @reviews = @design.reviews.order(created_at: :desc).page(params[:page])
    @review = Review.new
  end

  def create

    @design = Design.new(design_params)
    @design.user = current_user
    if verify_recaptcha
      if @design.save
      #  flash[:notice] = "Design Submitted!"
       redirect_to designs_path
      else
       render :new
      end
    else
     render :new
    end
  end

  def edit
    @design = Design.find(params[:id])
    if current_user == nil
      redirect_to designs_path
      flash[:notice] = "You can't edit other people's work!"
    else
      unless current_user.role == "admin" || @design.user == current_user
        redirect_to designs_path
        flash[:notice] = "You can't edit other people's work!"
      end
    end
  end

  def update
    @design = Design.find(params[:id])
    if current_user == nil
      redirect_to designs_path
      flash[:notice] = "You can't edit other people's work!"
    else
      unless current_user.role == "admin" || @design.user == current_user
        redirect_to designs_path
        flash[:notice] = "You can't edit other people's work!"
      end
    end
    if @design.update(design_params)
      flash[:notice] = 'Design Edited'
      redirect_to design_path(@design)
    else
      flash.now[:alert] = @design.errors.full_messages.join(":( ")
      render :edit
    end
  end

  def destroy
    @design = Design.find(params[:id])
    if current_user == nil
      redirect_to designs_path
      flash[:notice] = "You can't destroy other people's work!"
    else
      if @design.user == current_user || current_user.role == "admin"
        @design.destroy
        # flash[:notice] = "Design Deleted"
        redirect_to designs_path
      else
        redirect_to designs_path
        flash[:notice] = "You can't destroy other people's work!"
      end
    end
  end

  protected

  def design_params
    params.require(:design).permit(:design_name, :description, :user_id, :design_image)
  end
end
