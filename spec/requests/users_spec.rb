require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it 'renders a correct index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'include the correct placeholders' do
      get '/users'
      expect(response.body).to include('Users index')
    end
  end

  describe 'GET /show' do
    before :each do
      @user = User.create(name: 'Nasser', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Yemen.')
    end
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
    it 'renders a correct show template' do
      get '/users/:id'
      expect(response).to render_template(:show)
    end

    it 'include the correct placeholders' do
      get '/users/:id'
      expect(response.body).to include('User1')
    end
  end
end
