class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :movement
  has_many :work_sets
end
