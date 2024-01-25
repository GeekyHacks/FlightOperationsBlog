require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Abdu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Yemen.',
                        posts_counter: 0)
  end

  context '#most_recent_posts' do
    it 'should show last three posts for user' do
      post1 = Post.create(author: @user, title: 'Harru', text: 'Hello Abdu....', comments_counter: 0,
                          likes_counter: 0, created_at: '2024-01-13 21:23:17')
      post2 = Post.create(author: @user, title: 'Harru', text: 'Hello Abdu....', comments_counter: 0,
                          likes_counter: 0, created_at: '2024-01-13 21:24:17')
      post3 = Post.create(author: @user, title: 'Harru', text: 'Hello Abdu....', comments_counter: 0,
                          likes_counter: 0, created_at: '2024-01-13 21:24:36')
      post4 = Post.create(author: @user, title: 'Harru', text: 'Hello Abdu....', comments_counter: 0,
                          likes_counter: 0, created_at: '2024-01-13 21:24:36')
      expected_posts = [post4, post3, post2, post1]

      result = @user.most_recent_posts
      expect(result).to_not eql(expected_posts)
    end
  end

  context 'testing the user data entered' do
    it 'validates that name should not be blank' do
      @user.name = nil
      expect(@user).to_not be_valid
    end
  end

  context 'testing the posts_counter' do
    it 'validates that posts_counter is not blank' do
      @user.posts_counter = nil
      expect(@user).to_not be_valid
    end

    it 'validates that posts_counter is greater or equal to zero' do
      @user.posts_counter = -1
      expect(@user).to_not be_valid
    end
  end
end
