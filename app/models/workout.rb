class Workout < ApplicationRecord
  belongs_to :user

  def duration
    if self.start_at.nil? || self.end_at.nil?
      'Not completed'
    else
      distance_of_time_in_words(self.start_at, self.end_at)
    end
  end
end
