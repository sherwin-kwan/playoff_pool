# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, :type => :model do
  fixtures :users
  fixtures :teams 
  fixtures :rounds
  fixtures :series
  fixtures :predictions

  context "Joey's scores" do

    it 'should total 15 points' do
      joey = users(:joey)
      expect(joey.score).to eq(15)
    end

    it 'should total 7 correct series' do
      joey = users(:joey)
      expect(joey.correct_predictions).to eq(7)
    end

    it 'should total 1 successful lower seed pick' do
      joey = users(:joey)
      expect(joey.correct_lower_seed_picks).to eq(1)
    end

    it 'should give him rank 1' do
      joey = users(:joey)
      expect(joey.rank).to eq(1)
    end

    it 'should give sherwin rank 2' do
      sherwin = users(:sherwin)
      expect(sherwin.rank).to eq(2)
    end

    it 'should return the correct response to has_prediction_for' do
      sherwin = users(:sherwin)
      expect(sherwin.has_prediction_for?(series(:series15))).to be(false)
      expect(sherwin.has_prediction_for?(series(:series14))).to be(true)
      expect(series(:series14).user_has_prediction?(sherwin.id)).to be(true)
    end

  end
end