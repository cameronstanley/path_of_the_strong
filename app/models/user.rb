class User < ApplicationRecord
  has_secure_password

  has_many :workouts
  has_many :measurements
end
