require 'rails_helper'

RSpec.describe Series, type: :model do

  before do
    @round  = create(:round)
    @team1  = create(:team)
    @team2  = create(:team, :hurricanes)
    @series = create(:series, team1: @team1, team2: @team2, round: @round,
                              start_time: 2.days.from_now)
    Timecop.travel("2025-04-30T12:00:00Z") # to before the predictions
  end

  describe '#active_predictions' do
    it 'returns predictions sorted highest to lowest score' do
      user1 = create(:user)
      user2 = create(:user)
      completed_series = create(:series, team1: @team1, team2: @team2, round: @round,
                                         winner: @team1, games: 5,
                                         start_time: "2025-05-01T00:00:00Z")
      high_pred = create(:prediction, series: completed_series, winner: @team1, games: 5, user: user1)
      low_pred  = create(:prediction, series: completed_series, winner: @team2, games: 4, user: user2)

      predictions = completed_series.active_predictions

      expect(predictions.first.score).to be >= predictions.last.score
    end
  end

  describe 'validations' do
    it 'does not allow a team to play itself' do
      series = build(:series, team1: @team1, team2: @team1, round: @round)
      expect(series.save).to eq(false)
      expect(series.errors[:team1]).to include("Team can't play itself!")
    end
  end

  describe '#status' do
    after { Timecop.return }

    it 'returns :upcoming when current time is before start_time' do
      Timecop.freeze(@series.start_time - 1.hour)
      expect(@series.status).to eq(:upcoming)
    end

    it 'returns :ongoing when current time is after start_time and no winner is set' do
      Timecop.freeze(@series.start_time + 1.hour)
      expect(@series.status).to eq(:ongoing)
    end

    it 'returns :completed when a winner is set' do
      Timecop.freeze(@series.start_time + 1.hour)
      @series.update!(winner: @team1)
      expect(@series.status).to eq(:completed)
    end
  end

  describe '#start_time_formatted' do
    it 'returns the formatted time string in the configured time zone' do
      @series.update!(start_time: "2026-04-20T18:00:00Z")
      expect(@series.start_time_formatted).to eq("2026-04-20 at 18:00")
    end

    it 'returns "Not available" when start_time is nil' do
      @series.update!(start_time: nil)
      expect(@series.start_time_formatted).to eq("Not available")
    end
  end

end
