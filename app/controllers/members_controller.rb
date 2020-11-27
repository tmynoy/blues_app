class MembersController < ApplicationController
  def index
    @gk_members = Member.where(zone: 'GK')
    @df_members = Member.where(zone: 'DF')
    @mf_members = Member.where(zone: 'MF')
    @fw_members = Member.where(zone: 'FW')
  end

  def show
    @member = Member.find(params[:id])
    age_sum
    @comment = Comment.new
    @comments = @member.comments.includes(:user).order(id: "DESC")
    @eval_find = Evaluation.where(member_id: @member.id)
    @eval_user = @eval_find.where(user_id: current_user.id)
    @eval = Evaluation.find_by(member_id: @member.id)
    @eval_cur = Evaluation.find_by(user_id: current_user.id, member_id: @member.id)
    if @eval_find.exists?
      eva_sum
    end
  end

  private
  def age_sum
    birthday = @member.ord
    @age = (Date.today.strftime("%Y%m%d").to_i - birthday.strftime("%Y%m%d").to_i) / 10000
  end

  def eva_sum
    @total_average = @eval_find.average(:total_id).round(1)
    @offence_average = @eval_find.average(:offence_id).round(1)
    @deffence_average = @eval_find.average(:deffence_id).round(1)
    @pass_average = @eval_find.average(:pass_id).round(1)
    @dribble_average = @eval_find.average(:dribble_id).round(1)
    @physical_average = @eval_find.average(:physical_id).round(1)
    @pace_average = @eval_find.average(:pace_id).round(1)
  end
end