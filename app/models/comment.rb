class Comment < ActiveRecord::Base
  belongs_to :status
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :status_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 150 }
end
