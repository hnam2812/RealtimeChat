class Comment < ActiveRecord::Base
  belongs_to :status
  belongs_to :user

  validates :statuses_id, presence: true
  validates :users_id, presence: true
  validates :content, presence: true, length: { maximum: 60_000 }
end
