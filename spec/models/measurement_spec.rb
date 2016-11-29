require 'rails_helper'

RSpec.describe Measurement do
  describe 'associations' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :measured_at }
    it { should validate_presence_of :weight }
  end
end
