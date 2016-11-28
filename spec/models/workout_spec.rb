require 'rails_helper'

RSpec.describe Workout do
  describe 'associations' do
    it { should belong_to :user }
    it { should have_many :exercises }
  end

  describe '#duration' do
    subject { workout.duration }

    context 'when start at and end at present' do
      let(:current_time) { DateTime.now }
      let(:workout) { create(:workout, start_at: current_time, end_at: current_time + 1.hour) }

      it { is_expected.to eq('about 1 hour') }
    end

    context 'when start at or end at nil' do
      let(:workout) { create(:workout, start_at: nil, end_at: nil) }

      it { is_expected.to eq('Not completed') }
    end 
  end

end
