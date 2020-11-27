class EvaluationsController < ApplicationController
  def create
    @member = Member.find(params[:member_id])
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      redirect_to member_path(@member)
    else
      render member_path(@member)
    end
  end

  private
  def evaluation_params
    params.permit(:total_id, :offence_id, :deffence_id, :pass_id, :dribble_id, :physical_id, :pace_id).merge(user_id: current_user.id, member_id: params[:member_id])
  end
end