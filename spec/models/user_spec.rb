require 'rails_helper'

RSpec.describe User do
  it { should have_secure_password }
end
