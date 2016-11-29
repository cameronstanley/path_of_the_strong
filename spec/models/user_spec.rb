require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { should have_many :workouts }
    it { should have_many :measurements }
  end

  it { should have_secure_password }
end
