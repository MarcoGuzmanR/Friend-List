class FriendsController < ApplicationController
  def create
    @friend = Friend.create!(friend_params)
    redirect_to root_path
  end

  private

  def friend_params
    values = params.first[0]
    params.delete(values);
    values = JSON.parse(values)
    params[:friend] = values

    params.require(:friend).permit(:name, :email, :member_id)
  end
end
