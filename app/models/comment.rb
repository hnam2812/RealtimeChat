class Comment < ActiveRecord::Base
  belongs_to :status
  belongs_to :user

  validates :status_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 60_000 }
end
