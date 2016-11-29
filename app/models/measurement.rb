class Measurement < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :measured_at
  validates_presence_of :weight
end
