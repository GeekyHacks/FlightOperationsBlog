class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  after_create :update_user_posts_counter

  def most_recent_comments
    comments.order(created_at: :desc).order(5)
  end

  private

  def update_user_posts_counter
    User.increment_counter(:posts_counter, author_id)
  end
end
