class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_create :update_user_posts_counter

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_user_posts_counter
    User.increment_counter(:posts_counter, author_id)
  end

  #validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
