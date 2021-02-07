require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  # Authentication test suite
  describe 'POST /auth/login' do
    # create test user
    let!(:user) { create(:user) }
    # set test valid and invalid credentials
    let(:valid_credentials) do
      {
        email: user.email,
        password: user.password
      }
    end
    let(:invalid_credentials) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }
    end

    # set request.headers to our custon headers
    # before { allow(request).to receive(:headers).and_return(headers) }

    # returns auth token when request is valid
    context 'when request is valid' do
      before { post '/auth/login', params: valid_credentials }

      it 'returns a session with user_id' do
        expect(session[:user_id]).not_to be_nil
      end
    end

    # returns failure message when request is invalid
    context 'when request is invalid' do
      before { post '/auth/login', params: invalid_credentials }

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end

  describe 'GET /auth/logout' do
    context 'when user logs out' do
      before { get '/auth/logout' }

      it 'returns a session without user_id' do
        expect(session[:user_id]).to be_nil
      end
    end
  end

end
