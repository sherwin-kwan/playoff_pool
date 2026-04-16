# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, :type => :model do

  it "can be created" do
    user = build(:user)
    expect(user.save).to be(true)
  end

  it "must have name and email" do
    user = build(:user, email: nil)
    expect(user.save).to be(false)
    user = build(:user, name: nil)
    expect(user.save).to be(false)
  end

  it 'cannot be created with a password shorter than 6 characters' do
    user = build(:user, password: 'abcde', password_confirmation: 'abcde')
    expect(user.save).to be false
  end

  it "creates with a user score object attached in the current year" do
    
  end

  it 'can be created via from_omniauth without a password' do
    auth = OmniAuth::AuthHash.new(
      provider: 'google_oauth2', uid: '999',
      info: { email: 'new@google.com', name: 'New User', first_name: 'New' }
    )
    expect { User.from_omniauth(auth) }.to change(User, :count).by(1)
    user = User.find_by(email: 'new@google.com')
    expect(user.provider).to eq 'google_oauth2'
    expect(user.password_digest).to be_nil
  end
  
end