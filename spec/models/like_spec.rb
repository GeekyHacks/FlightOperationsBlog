require 'rails_helper'
RSpec.describe Like, type: :model do
  before :each do
    @author = User.create(name: 'Abdu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Yemen.')
    @user = User.create(name: 'Nasser', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Yemen.')
    @post = Post.create(author: @author, title: 'Harru', text: 'Hello Abdu....', comments_counter: 0,
                        likes_counter: 0)
  end

  context '#create' do
    it 'is valid with existing user and post' do
      expect(Like.new(user: @user, post: @post)).to be_valid
    end

    it 'is not valid without post' do
      expect(Like.new(user: @user)).to_not be_valid
    end

    it 'is not valid without user' do
      expect(Like.new(post: @post)).to_not be_valid
    end
  end
end
