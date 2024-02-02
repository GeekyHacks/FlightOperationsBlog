require 'rails_helper'
require 'capybara/rails'
require 'spec_helper'

RSpec.describe 'User Index Page', type: :feature do
  before do
    user = User.create(name: 'Abdu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Yemen.',
                       posts_counter: 1)
    visit users_path
  end

  it 'shows all users with their username and profile picture' do
    User.all.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_selector("img[src*='#{user.photo}']")
    end
  end

  it 'shows the number of posts each user has written' do
    User.all.each do |user|
      expect(page).to have_content("Number of Posts:#{user.posts_counter}")
    end
  end

  it 'When I click on a user, I am redirected to that user\'s show page' do
    user = User.first
    click_link user.name, exact: false

    expect(current_path).to eq(user_path(user))
  end
end
