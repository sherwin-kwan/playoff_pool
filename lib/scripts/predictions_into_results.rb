first_year_in_db = Prediction.joins(:series).pluck(:year).min
years_to_run_script_on = (first_year_in_db...Time.now.year).to_a

years_to_run_script_on.each do |year|
  predictions_in_year = Prediction.joins(:series).where(series: {year: year})
  users_in_year = predictions_in_year.pluck(:user_id).uniq
  users_in_year.each do |user_id|
    next if Result.find_by(user_id: user_id, year: year).present?
    users_predictions = predictions_in_year.where(user_id: user_id)
    correct = users_predictions.joins(:series).where("series.winner_id = predictions.winner_id")
    correct_count = correct.count
    incorrect_count = users_predictions.count - correct_count
    lower_seed_total = users_predictions.joins(:series).where("predictions.winner_id = series.team2_id").count
    lower_seed_correct = correct.joins(:series).where("predictions.winner_id = series.team2_id").count
    lower_seed_incorrect = lower_seed_total - lower_seed_correct
    points = User.find(user_id).score(year)
    Result.where(user_id: user_id, year: year, correct: correct_count, incorrect: incorrect_count, lower_seed_correct: lower_seed_correct, lower_seed_incorrect: lower_seed_incorrect, points: points).first_or_create
  end
end