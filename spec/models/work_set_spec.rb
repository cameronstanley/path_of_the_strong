require 'rails_helper'

RSpec.describe WorkSet do
  it { should belong_to :exercise }
end
