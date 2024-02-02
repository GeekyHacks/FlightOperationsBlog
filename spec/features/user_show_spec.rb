require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  # let(:user) do
  # end
  before do
    @user = User.create(name: 'Abdu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Yemen.',
                        posts_counter: 0)
    # post = Post.create(author: @user, title: 'Harru', text: 'text', comments_counter: 0,
    #                    likes_counter: 0)
    visit user_path(@user)
  end

  it 'shows the user details' do
    expect(page).to have_selector("img[src*='#{@user.photo}']")
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Number of Posts:#{@user.posts_counter}")
    expect(page).to have_content(@user.bio)
  end

  it 'shows the first 3 posts of the user' do
    @user.posts.limit(3).each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'redirects to the posts index page when view all posts button is clicked' do
    click_on 'posts'
    expect(current_path).to eq(user_posts_path(@user))
  end

  it 'redirects to a post show page when a post is clicked' do
    post = @user.posts.create(title: 'Sample Title', text: 'Sample Text')

    link_text = 'Post'
    expect(page).to have_link(link_text)

    click_link(link_text)
    expect(current_path).to eq(user_post_path(@user, post))
  end
end
