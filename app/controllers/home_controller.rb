class HomeController < ApplicationController
  def index
    @users = User.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages).all
  end
end
