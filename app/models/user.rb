class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :send_conversations, class_name: "Conversation",
    foreign_key: :sender_id
  has_many :received_conversations, class_name: "Conversation",
    foreign_key: :recipient_id

  def conversations
    Conversation.where("sender_id = ? OR recipient_id = ?", self.id, self.id)
  end
end
