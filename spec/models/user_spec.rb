# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, :type => :model do

  it "can be created" do
    user = FactoryBot.build(:user)
    expect(user.save).to be(true)
  end

  it "must have name and email" do
    user = FactoryBot.build(:user, email: nil)
    expect(user.save).to be(false)
    user = FactoryBot.build(:user, name: nil)
    expect(user.save).to be(false)
  end

  it "creates with a user score object attached in the current year" do
    
  end

end