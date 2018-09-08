class SessionsController < ApplicationController
  before_action :require_login, only: :destroy

  def new
  end

  def create
    user = login(params[:email], params[:password])

    unless user
      render :new and return
    end

    redirect_to root_path
  end

  def destroy
    logout
    redirect_to signin_path
  end
end
