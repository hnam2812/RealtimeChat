class HomeController < ApplicationController
  def index
    session[:conversations] ||= []
    @users = current_user.following
    @conversations = current_user.conversations.includes(:recipient, :messages)
      .find(session[:conversations])
  end
end
