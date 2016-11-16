class DashboardController < ApplicationController

  before_action :check_logged_in

  def index
    @recent_workouts = Workout.where(user_id: current_user.id).order(start_at: :desc).limit(5)
  end

end
