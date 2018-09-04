class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    redirect_to signin_path
  end
end
