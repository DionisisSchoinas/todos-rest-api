require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:valid_attributes) do
    {
      name: user.name,
      email: user.email,
      password: user.password,
      password_confirmation: user.password
    }
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: valid_attributes }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully, and logged in automatically/)
      end

      it 'returns a session with user_id' do
        expect(session[:user_id]).not_to be_nil
      end
    end

    context 'when problem because' do
      before { post '/signup', params: {} }

      it 'password confirmation is missing' do
        expect(response).to have_http_status(406)
      end
    end

    context 'when problem because' do
      before { post '/signup', params: valid_attributes }
      before { post '/signup', params: valid_attributes }

      it 'email is taken'do
        expect(response).to have_http_status(422)
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {password_confirmation: "pass"} }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Password digest can't be blank/)
      end
    end
  end
end
