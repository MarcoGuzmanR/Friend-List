class HomepageController < ApplicationController
  def index; end

  def show_members
    @members = Member.all
    render json: { members: @members }
  end
end
