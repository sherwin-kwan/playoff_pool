require 'rails_helper'

# Case 8 — password sign-up links to an existing OAuth account
RSpec.describe 'user registration', type: :request do
  it 'links a password to an existing OAuth-only account rather than creating a duplicate' do
    oauth_user = create(:user, :oauth_user, email: 'shared@example.com')

    expect {
      post '/users', params: {
        user: {
          name:                  oauth_user.name,
          email:                 'shared@example.com',
          password:              'newpassword',
          password_confirmation: 'newpassword'
        }
      }
    }.not_to change(User, :count)

    oauth_user.reload
    expect(oauth_user.authenticate('newpassword')).to be_truthy
    expect(oauth_user.provider).to eq 'google_oauth2'
    expect(session[:current_user]).to eq oauth_user.id
  end
end
