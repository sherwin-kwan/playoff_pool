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

  describe '#rank' do
    before do
      @user = create(:user)
      @user2 = create(:user)
      @year = 2024
    end

    it 'is 1 when the user has the highest score in that year' do
      @user.results.create(year: @year, points: 20, correct: 10, lower_seed_correct: 3)
      @user2.results.create(year: @year, points: 15, correct: 8, lower_seed_correct: 2)

      expect(@user.rank(@year)).to eq(1)
    end

    it 'is 1 when the user has the joint highest score in that year with better tiebreakers' do
      @user.results.create(year: @year, points: 20, correct: 10, lower_seed_correct: 3)
      @user2.results.create(year: @year, points: 15, correct: 10, lower_seed_correct: 2)

      expect(@user.rank(@year)).to eq(1)
    end

    it 'is 1 when the user has the joint highest score in that year with better tiebreakers (2)' do
      @user.results.create(year: @year, points: 20, correct: 10, lower_seed_correct: 3)
      @user2.results.create(year: @year, points: 15, correct: 9, lower_seed_correct: 4)

      expect(@user.rank(@year)).to eq(1)
    end

    it 'is 2 when the user has the joint highest score in that year with worse tiebreakers' do
      @user.results.create(year: @year, points: 20, correct: 10, lower_seed_correct: 3)
      @user2.results.create(year: @year, points: 20, correct: 11, lower_seed_correct: 2)

      expect(@user.rank(@year)).to eq(2)
    end

    it 'is not affected by results from other years' do
      @user.results.create(year: @year, points: 20, correct: 10, lower_seed_correct: 3)
      @user2.results.create(year: 2023, points: 99, correct: 15, lower_seed_correct: 8)

      expect(@user.rank(@year)).to eq(1)
    end

    it 'is 4 when 3 other users have higher scores in that year' do
      @user.results.create(year: @year, points: 10, correct: 5, lower_seed_correct: 1)
      3.times { create(:user).results.create(year: @year, points: 20, correct: 10, lower_seed_correct: 3) }

      expect(@user.rank(@year)).to eq(4)
    end
  end

end