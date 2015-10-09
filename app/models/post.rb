class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :location
  has_many :likes
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :location, presence: true, length: { minimum: 5 }
  # validates :type_post, presence: true
  validates :title, presence: true, length: { minimum: 10 }
  validates :area, presence: true
  validates :price, presence: true
  validates :address, presence: true, length: { minimum: 5 }
  validates :desc, presence: true, length: { maximum: 1000 }
  validate :picture_size

  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
    end
  end
  
end
