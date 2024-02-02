require 'rails_helper'

RSpec.describe 'User Post Index Page', type: :feature do
  before do
    @user = User.create(name: 'Abdu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Yemen.',
                        posts_counter: 0)
    11.times { |i| Post.create(author: @user, title: "Post #{i}", text: "Content of post #{i}") }
    visit user_posts_path(user)
  end

  it 'shows the user and posts details' do
    expect(page).to have_selector("img[src*='#{@user.photo}']")
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")

    visible_posts = user.posts.includes(:comments,
                                        :likes).order(created_at: :desc)

    visible_posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text.truncate(100)) # Assuming you show a truncated body
      expect(page).to have_content("Comments: #{post.comments.count}")
      expect(page).to have_content("Likes: #{post.likes.count}")
      post.recent_comments.each do |comment|
        expect(page).to have_content(comment.user.name)
        expect(page).to have_content(comment.text)
        unique_comment_content = "#{comment.user.name}: #{comment.text}"
        expect(page).to have_content(unique_comment_content)
      end
    end
  end

  it 'shows pagination if there are more posts than fit on the view' do
    expect(page).to have_selector('.pagination')
    expect(page).to have_link('2') # Checking for a link to the second page
  end

  it 'redirects to a post show page when a post is clicked' do
    first_post = user.posts.includes(:comments, :likes).order(created_at: :desc).first
    find('a', text: first_post.title, match: :prefer_exact).click
    expect(current_path).to eq(user_post_path(user, first_post))
  end
end
