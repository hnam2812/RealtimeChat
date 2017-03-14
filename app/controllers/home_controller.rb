class HomeController < ApplicationController
  def index
    session[:conversations] ||= []
    @users = User.where.not(id: current_user)
    @conversations = current_user.conversations.includes(:recipient, :messages)
      .find(session[:conversations])
  end
end
