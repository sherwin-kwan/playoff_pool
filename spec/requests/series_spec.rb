require 'rails_helper'
require 'request_helpers'

RSpec.describe 'Series routes', type: :request do
  context 'GET /series' do
    before do
      allow(ENV).to receive(:[]).and_call_original
      allow(ENV).to receive(:[]).with('CURRENT_YEAR').and_return('2024')

      round = create(:round)
      team1 = create(:team)
      team2 = create(:team, :hurricanes)

      @early_series = create(:series, team1: team1, team2: team2, round: round,
                                      year: 2024, start_time: '2024-04-20T18:00:00Z')
      @late_series  = create(:series, team1: team1, team2: team2, round: round,
                                      year: 2024, start_time: '2024-05-01T18:00:00Z')
      @old_series   = create(:series, team1: team1, team2: team2, round: round,
                                      year: 2023, start_time: '2023-04-20T18:00:00Z')
    end

    it 'displays series from the current year' do
      get '/series'
      expect(response.body).to include(@early_series.start_time_formatted)
      expect(response.body).to include(@late_series.start_time_formatted)
    end

    it 'does not display series from past years' do
      get '/series'
      expect(response.body).not_to include(@old_series.start_time_formatted)
    end

    it 'displays series sorted by start_time from earliest to latest' do
      get '/series'
      early_pos = response.body.index(@early_series.start_time_formatted)
      late_pos  = response.body.index(@late_series.start_time_formatted)
      expect(early_pos).to be < late_pos
    end
  end

  context 'GET /series/new' do
    include RequestHelpers

    it 'redirects an unauthenticated user to login' do
      get '/series/new'
      expect(response).to redirect_to('/login')
    end

    it 'shows an error to a logged-in non-admin user' do
      login_as(create(:user))
      get '/series/new'
      expect(response.body).to include('You do not have permission to view this page')
    end

    it 'allows an admin user through' do
      login_as(create(:user, privilege: :admin))
      get '/series/new'
      expect(response.status).to eq(200)
      expect(response.body).not_to include('You do not have permission')
    end
  end

  context 'POST /series' do
    include RequestHelpers

    before do
      @round = create(:round)
      @team1 = create(:team)
      @team2 = create(:team, :hurricanes)
      @valid_params = {
        team1_id: @team1.id,
        team2_id: @team2.id,
        round_id: @round.id,
        start_time: 1.day.from_now,
        year: Time.now.year
      }
    end

    it 'bars a non-admin user' do
      login_as(create(:user))
      expect { post '/series', params: { series: @valid_params } }.not_to change(Series, :count)
      expect(response.body).to include('You do not have permission to view this page')
    end

    it 'does not allow a series with a start_time in the past' do
      login_as(create(:user, privilege: :admin))
      post '/series', params: { series: @valid_params.merge(start_time: 1.day.ago) }
      expect(response).to redirect_to(new_series_path)
    end

    it 'does not allow team1 and team2 to be the same team' do
      login_as(create(:user, privilege: :admin))
      post '/series', params: { series: @valid_params.merge(team2_id: @team1.id) }
      expect(response).to redirect_to(new_series_path)
    end
  end

  context 'DELETE /series/:id' do
    include RequestHelpers

    it 'does not destroy the series' do
      round  = create(:round)
      team1  = create(:team)
      team2  = create(:team, :hurricanes)
      series = create(:series, team1: team1, team2: team2, round: round)
      login_as(create(:user, privilege: :admin))

      expect { delete "/series/#{series.id}" }.not_to change(Series, :count)
      expect(Series.exists?(series.id)).to be true
    end
  end
end
