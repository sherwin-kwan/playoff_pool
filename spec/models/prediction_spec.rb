# spec/models/prediction_spec.rb

require 'rails_helper'

RSpec.describe Prediction, :type => :model do
  fixtures :users
  fixtures :teams 
  fixtures :rounds
  fixtures :series
  fixtures :predictions

  it "awards no points if prediction is wrong" do
    pred = predictions(:pred_joey_1)
    expect(pred.score).to eq(0)
  end

  it "awards 1 point for a correct prediction" do 
    pred = predictions(:pred_billy_2)
    expect(pred.score).to eq(1)
  end

  it "awards double points for a correct prediction with games" do
    pred = predictions(:pred_joey_2)
    expect(pred.score).to eq(2)
  end

  it "handles later rounds correctly" do
    pred = predictions(:pred_joey_13)
    expect(pred.score).to eq(2)
  end

  it "handles double points bonus correctly in later rounds" do
    pred = predictions(:pred_sher_14)
    expect(pred.score).to eq(4)
  end

end