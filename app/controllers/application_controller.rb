class ApplicationController < ActionController::Base
  private

  def not_authenticated
    redirect_to signin_path
  end
end
