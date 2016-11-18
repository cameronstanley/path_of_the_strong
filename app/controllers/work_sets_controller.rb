class WorkSetsController < ApplicationController

  before_action :check_logged_in
  before_action :get_workout
  before_action :get_exercise

  def create
    @work_set = WorkSet.new(work_set_params)
    @work_set.exercise_id = @exercise.id

    if @work_set.save
      flash[:success] = 'Set was successfully created.'
      redirect_to edit_workout_path(@workout)
    else
      flash.now[:error] = 'An error occurred. Please correct the issues on the form and resubmit.'
      render edit_workout_path(@workout)
    end
  end

  def destroy
    @work_set = WorkSet.find_by(id: params[:id], exercise_id: @exercise.id)
    @work_set.destroy
    flash[:success] = 'Set was successfully removed.'
    redirect_to edit_workout_path(@workout)
  end

  private

  def get_workout
    @workout = Workout.find_by(id: params[:workout_id], user_id: current_user.id)
  end

  def get_exercise
    @exercise = Exercise.find_by(id: params[:exercise_id], workout_id: @workout.id)
  end

  def work_set_params
    params.require(:work_set).permit(:repetitions, :weight)
  end

end
