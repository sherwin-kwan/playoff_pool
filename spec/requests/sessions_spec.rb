require 'rails_helper'

RSpec.describe 'sessions', type: :request do

  it 'logs in a user with correct credentials' do
    user = create(:user, email: 'pw@example.com', password: 'correctpw',
                         password_confirmation: 'correctpw')
    post '/login', params: { email: 'pw@example.com', password: 'correctpw' }
    expect(session[:current_user]).to eq user.id
    expect(response).to redirect_to root_path
  end

  it 'rejects wrong password' do
    create(:user, email: 'pw@example.com', password: 'correctpw',
                  password_confirmation: 'correctpw')
    post '/login', params: { email: 'pw@example.com', password: 'wrongpw' }
    expect(session[:current_user]).to be_nil
    expect(response).to redirect_to login_path
  end

  it 'rejects unknown email' do
    post '/login', params: { email: 'nobody@example.com', password: 'anything' }
    expect(session[:current_user]).to be_nil
    expect(response).to redirect_to login_path
  end

  it 'logs in an existing OAuth user via Google callback' do
    user = create(:user, :oauth_user, email: 'google@example.com')
    mock_google_auth(email: 'google@example.com', uid: user.uid)
    get '/auth/google_oauth2/callback'
    expect(session[:current_user]).to eq user.id
    expect(response).to redirect_to root_path
  end

  it 'creates a new user on first Google sign-in' do
    mock_google_auth(email: 'brand_new@google.com', uid: '777')
    expect { get '/auth/google_oauth2/callback' }.to change(User, :count).by(1)
    expect(session[:current_user]).to eq User.find_by(email: 'brand_new@google.com').id
  end

  it 'links a Google account to an existing password-only account by email' do
    existing = create(:user, email: 'shared@example.com')
    expect(existing.provider).to be_nil

    mock_google_auth(email: 'shared@example.com', uid: '555')
    expect { get '/auth/google_oauth2/callback' }.not_to change(User, :count)

    existing.reload
    expect(existing.provider).to eq 'google_oauth2'
    expect(existing.uid).to eq '555'
    expect(session[:current_user]).to eq existing.id
  end

end
