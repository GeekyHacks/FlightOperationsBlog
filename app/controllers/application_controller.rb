class ApplicationController < ActionController::Base
  def current_user
    @current_user = User.find(params[:user_id])
    pp @current_user
  end
end
