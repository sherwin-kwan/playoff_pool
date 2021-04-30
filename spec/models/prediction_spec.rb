# spec/models/prediction_spec.rb

require 'rails_helper'

RSpec.describe Prediction, :type => :model do
  # nothing
  it "awards no points if prediction is wrong"
  it "awards 1 point for a correct prediction"
  it "awards double points for a correct prediction with games"
end