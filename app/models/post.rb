class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :location
  has_many :likes
  has_many :commends
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

  def review_total
    self.commends.size
  end

  def self.list_categories
    Category.all
  end

  def self.search(search, min_price, max_price)
    @posts = Post.all

    if search == nil
      search = ''
    end
    # binding.pry
    if min_price == nil
      min_price = 0
    end
    if max_price == nil
      max_price = 1_000_000_000_000
    end
    @posts = @posts.where(["title LIKE ?", "%#{search}%"]) if search != nil
    @posts = @posts.where(["price <= ?", max_price]) if max_price != nil
    @posts = @posts.where(["price >= ?", min_price]) if min_price != nil
end
  
  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
    end
  end
  
end
