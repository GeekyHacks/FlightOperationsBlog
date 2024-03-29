class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_likes_counter

  def update_post_likes_counter
    Post.increment_counter(:likes_counter, post_id)
  end
end
