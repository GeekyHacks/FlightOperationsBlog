require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Abdu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Yemen.',
                        posts_counter: 0)
    @post = Post.create(author: @user, title: 'Harru', text: 'text', comments_counter: 0,
                        likes_counter: 0)
  end

  context '#most_recent_comments' do
    it 'should show last three posts for user' do
      comment1 = Comment.create(user: @user, post: @post, text: 'Hello Abdu....')
      comment2 = Comment.create(user: @user, post: @post, text: 'Hello Abdu....')
      comment3 = Comment.create(user: @user, post: @post, text: 'Hello Abdu....')
      comment4 = Comment.create(user: @user, post: @post, text: 'Hello Abdu....')
      comment5 = Comment.create(user: @user, post: @post, text: 'Hello Abdu....')
      comment6 = Comment.create(user: @user, post: @post, text: 'Hello Abdu....')

      expected_posts = [comment1, comment2, comment3, comment4, comment5, comment6]

      result = @post.most_recent_comments
      expect(result).to_not eql(expected_posts)
    end
  end

  context 'testing the post data ' do
    it 'validates that title should not be blank' do
      @post.title = nil
      expect(@post).to_not be_valid
    end
  end

  context 'testing the comments_counter' do
    it 'validates that comments_counter is not blank' do
      @post.comments_counter = nil
      expect(@post).to_not be_valid
    end
    it 'validates that comments_counter is greater or equal to zero' do
      @post.comments_counter = -1
      expect(@post).to_not be_valid
    end
  end
  context 'testing the likes_counter' do
    it 'validates that likes_counter is not blank' do
      @post.likes_counter = nil
      expect(@post).to_not be_valid
    end
    it 'validates that likes_counter is greater or equal to zero' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end
  end
end
