class ConversationsController < ApplicationController
  def create
    if request.xhr?
      @conversation = Conversation.between(current_user.id, params[:user_id]).first
      if @conversation.present?
        add_to_conversations unless conversated?
        return @conversation
      end
      @conversation = Conversation.create(sender_id: current_user.id,
        recipient_id: params[:user_id])
      add_to_conversations unless conversated?
    end
  end

  def close
    @conversation = Conversation.find(params[:id])
    session[:conversations].delete(@conversation.id)
    respond_to do |format|
      format.js
    end
  end


  private
  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end

  def conversated?
    session[:conversations].include?(@conversation.id)
  end
end
