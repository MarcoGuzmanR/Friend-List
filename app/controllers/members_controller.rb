class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @friends = @member.friends

    respond_to do | format |
      format.html
      format.json { render json: { friends: @friends } }
    end
  end

end
