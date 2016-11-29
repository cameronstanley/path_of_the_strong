require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#flash_class' do
    subject { helper.flash_class(level) }

    context 'when success' do
      let(:level) { :success }
      it { is_expected.to eq('alert-success') }
    end

    context 'when notice' do
      let(:level) { :notice }
      it { is_expected.to eq('alert-info') }
    end

    context 'when warning' do
      let(:level) { :warning }
      it { is_expected.to eq('alert-warning') }
    end

    context 'when error' do
      let(:level) { :error }
      it { is_expected.to eq('alert-danger') }
    end
  end
end
