class HomeController < ApplicationController
  def index
    @users = User.where.not(id: current_user)
    @conversations = current_user.conversations.includes(:recipient, :messages).all
  end
end
