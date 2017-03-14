class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      session[:conversations] ||= []
      @users = current_user.following
      @conversations = current_user.conversations.includes(:recipient, :messages)
        .find(session[:conversations])
    end
  end
end
