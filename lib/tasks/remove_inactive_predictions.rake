task :remove_inactive_predictions => :environment do

  old_predictions = Prediction.all.filter{|p| !p.active?}
  puts "#{Prediction.all.size}"
  old_predictions.each do |pred|
    pred.destroy
  end
  puts "#{Prediction.all.size}"
  puts "DONE"
end