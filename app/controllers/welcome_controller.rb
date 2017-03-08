class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # @session_url = session_path resource_name
  end
end
