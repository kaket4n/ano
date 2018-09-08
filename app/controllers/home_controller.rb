class HomeController < ApplicationController
  def index
    @users = User.last(5)
  end
end
