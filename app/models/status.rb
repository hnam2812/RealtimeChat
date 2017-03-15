class Status < ActiveRecord::Base
  STATUS_PARAMS = [ :content, :_destroy, :id]

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2000 }

  default_scope -> { order(created_at: :desc) }

  scope :following_status, -> ids {where("statuses.user_id IN (?)", ids)}
end
