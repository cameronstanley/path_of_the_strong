class ExercisesController < ApplicationController

  before_action :check_logged_in
  before_action :get_workout

  def create
    @exercise = Exercise.new(new_exercise_params)
    @exercise.workout_id = @workout.id

    if @exercise.save
      flash[:success] = 'Exercise was successfully created.'
      redirect_to edit_workout_path(@workout)
    else
      flash.now[:error] = 'An error occurred. Please correct the issues on the form and resubmit.'
      render edit_workout_path(@workout)
    end
  end

  private

  def get_workout
    @workout = Workout.find_by(id: params[:workout_id], user_id: current_user.id)
  end

  def new_exercise_params
    params.require(:exercise).permit(:movement_id)
  end

end
