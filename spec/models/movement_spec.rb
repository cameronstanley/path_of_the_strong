require 'rails_helper'

RSpec.describe Movement do
  it { should have_many :exercises }
end
