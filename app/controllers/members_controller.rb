class MembersController < ApplicationController
  def create
    @member = Member.new(member_params)
    if @member.save!
      render status: 200
    else
      render status: 500
    end
  end

  private

  def member_params
    values = params.first[0]
    params.delete(values);
    values = JSON.parse(values)
    params[:member] = values

    params.require(:member).permit(
      :name,
      :email)
  end
end
