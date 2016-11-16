require 'rails_helper'

RSpec.describe Exercise do
  it { should belong_to :workout }
  it { should belong_to :movement }
  it { should have_many :work_sets }
end
