module ApplicationHelper
  def post_number(post)
    @post_counter ||= {}
    @post_counter[post.author_id] ||= 0
    @post_counter[post.author_id] += 1
    @post_counter[post.author_id]
  end
end
