class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc)
  end

  def show
    # find the users with id greater than 0
    @user = User.where('id > 0').find_by(id: params[:id])
  end
end
