class MembersController < ApplicationController
  def create
    @member = Member.create!(member_params)
    redirect_to root_path
  end

  private

  def member_params
    values = params.first[0]
    params.delete(values);
    values = JSON.parse(values)
    params[:member] = values

    params.require(:member).permit(:name, :email)
  end
end
