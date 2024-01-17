require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
    end

    it 'renders a correct index template' do
      get '/users/:user_id/posts'
      expect(response).to render_template(:index)
    end

    it 'include the correct placeholders' do
      get '/users/:user_id/posts'
      expect(response.body).to include('Find me in app/views/posts/index.html.erb')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end
    it 'renders a correct index template' do
      get '/users/:user_id/posts/:id'
      expect(response).to render_template(:show)
    end

    it 'include the correct placeholders' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('Find me in app/views/posts/show.html.erb')
    end
  end
end
