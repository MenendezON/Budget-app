class HomeController < ApplicationController
  load_and_authorize_resource

  def index
    @current_user_name = current_user.name
  end
end
