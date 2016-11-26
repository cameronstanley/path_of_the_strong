class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises

  def duration
    if start_at.nil? || end_at.nil?
      'Not completed'
    else
      distance_of_time_in_words(start_at, end_at)
    end
  end
end
