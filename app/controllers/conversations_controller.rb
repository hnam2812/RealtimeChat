class ConversationsController < ApplicationController
  def create
    if request.xhr?
      @conversation = Conversation.between(current_user.id, params[:user_id]).first
      return @conversation if @conversation.present?

      @conversation = Conversation.create(sender_id: current_user.id,
        recipient_id: params[:user_id])
    end
  end
end
