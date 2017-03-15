class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      session[:conversations] ||= []
      @users = current_user.following
      @conversations = current_user.conversations.includes(:recipient, :messages)
        .find(session[:conversations])
      @new_feed = get_new_feed
    end
  end

  private
  def get_new_feed
    fl_ids = current_user.following.pluck(:id) << current_user.id
    Status.following_status(fl_ids)
  end
end
