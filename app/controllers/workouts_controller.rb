class WorkoutsController < ApplicationController

  before_action :check_logged_in

  def index
    @workouts = Workout.where(user_id: current_user.id).order(:start_at)
  end

  def show
    @workout = Workout.find_by(id: params[:id], user_id: current_user.id)
  end

  def new
    @workout = Workout.new(name: DateTime.now.strftime('%A'))
  end

  def create
    @workout = Workout.new(new_workout_params)
    @workout.user = current_user
    @workout.start_at = DateTime.now

    if @workout.save
      flash[:success] = 'Workout was successfully created.'
      redirect_to edit_workout_path(@workout)
    else
      flash.new[:error] = 'An error occurred. Please correct the issues on the form and resubmit.'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    workout = Workout.find_by(id: params[:id], user_id: current_user.id)
    workout.destroy
    flash[:success] = 'Workout was successfully deleted.'
    redirect_to workouts_path
  end

  private

  def new_workout_params
    params.require(:workout).permit(:name)
  end

end