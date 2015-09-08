class VotesController < ApplicationController
  before_action :pre_vote
  def vote1
    if @value.vote == 1.0
      @value.vote -= 1.0
    else
      @value.vote = 1.0
    end
    respond_to do |format|
      @value.save
      @vote_total = Vote.group(:design_id).sum(:vote)
      format.json { render json: @vote_total[@design.id] }
    end
  end

  # def vote2
  #   if @value.vote == 2.0
  #     @value.vote -= 2.0
  #   else
  #     @value.vote = 2.0
  #   end
  #   respond_to do |format|
  #     @value.save
  #     @vote_total = Vote.group(:design_id).sum(:vote)
  #     format.json { render json: @vote_total[@design.id] }
  #   end
  # end
  #
  # def vote3
  #   if @value.vote == 3.0
  #     @value.vote -= 3.0
  #   else
  #     @value.vote = 3.0
  #   end
  #   respond_to do |format|
  #     @value.save
  #     @vote_total = Vote.group(:design_id).sum(:vote)
  #     format.json { render json: @vote_total[@design.id] }
  #   end
  # end
  #
  # def vote4
  #   if @value.vote == 4.0
  #     @value.vote -= 4.0
  #   else
  #     @value.vote = 4.0
  #   end
  #   respond_to do |format|
  #     @value.save
  #     @vote_total = Vote.group(:design_id).sum(:vote)
  #     format.json { render json: @vote_total[@design.id] }
  #   end
  # end
  #
  # def vote5
  #   if @value.vote == 5.0
  #     @value.vote -= 5.0
  #   else
  #     @value.vote = 5.0
  #   end
  #   respond_to do |format|
  #     @value.save
  #     @vote_total = Vote.group(:design_id).sum(:vote)
  #     format.json { render json: @vote_total[@design.id] }
  #   end
  # end


  def pre_vote
    @review = Review.find(params[:design_id])
    @value = Vote.find_or_initialize_by(review: @review, user: current_user)
  end
end
