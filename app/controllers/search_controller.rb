class SearchController < ApplicationController
  def index
    @users = User.ransack(email_or_last_first_or_first_last_cont: params[:q]).result
  end
end
