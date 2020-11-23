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
  end

  private
  def age_sum
    birthday = @member.ord
    @age = (Date.today.strftime("%Y%m%d").to_i - birthday.strftime("%Y%m%d").to_i) / 10000
  end
end