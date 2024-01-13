class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_comments_counter

  def update_post_comments_counter
    post.increment_counter(:comments_counter, post_id)
  end
end
