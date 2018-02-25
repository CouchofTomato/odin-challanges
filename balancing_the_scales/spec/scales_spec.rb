require 'spec_helper'
require 'scales'

RSpec.describe '#balance' do
  context 'when the scales are balanced' do
    it 'returns nil' do
      expect(balance(1,1,[1,2,3])).to be_nil
    end
  end

  context 'when only one weight is required to balance one side of the scale' do
    let(:balance_response) { balance(1,3,[2,6,7,10]) }
    it 'returns an array of one value' do
      expect(balance_response).to eql [2]
      expect(balance_response.length).to eq 1 
    end
  end

  context 'when a weight is required on each side of the scale' do
    let(:balance_response) { balance(1,3,[4,6,9,15]) }
    it 'returns an array with two values' do
      expect(balance_response).to eq [4,6]
      expect(balance_response.length). to eq 2
    end
  end

  context 'when none of the weight combinations can make the scales balance' do
    let(:balance_response) { balance(1,2,[3,6,9,12]) }
    it 'returns nil' do
      expect(balance_response).to be_nil
    end
  end
end
