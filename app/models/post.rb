class Post < ActiveRecord::Base
  belongs_to :users
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :location, presence: true, length: { minimum: 5 }
  validates :type_post, presence: true
  validates :title, presence: true, length: { minimum: 10 }
  validates :area, presence: true
  validates :price, presence: true
  validates :address, presence: true, length: { minimum: 5 }
  validates :desc, presence: true, length: { maximum: 1000 }
end
