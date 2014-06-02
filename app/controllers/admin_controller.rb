class AdminController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :authorize!

  private
  def authorize!
    return if current_user.role == "admin"
    redirect_to root_path
  end
end
