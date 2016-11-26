class WorkoutsController < ApplicationController
  before_action :check_logged_in

  def index
    @workouts = Workout.where(user_id: current_user.id).order(:start_at).paginate(page: params[:page], per_page: 10)
  end

  def show
    @workout = Workout.find_by(id: params[:id], user_id: current_user.id)
  end

  def create
    @workout = Workout.new(new_workout_params)
    @workout.user = current_user
    @workout.start_at = DateTime.now

    if @workout.save
      flash[:success] = 'Workout was successfully created.'
      redirect_to edit_workout_path(@workout)
    else
      flash.now[:error] = 'An error occurred. Please correct the issues on the form and resubmit.'
      render :index
    end
  end

  def edit
    @workout = Workout.find_by(id: params[:id], user_id: current_user.id)
    @exercise = Exercise.new
    @movements = Movement.all
  end

  def update
    @workout = Workout.find_by(id: params[:id], user_id: current_user.id)

    if @workout.update(edit_workout_params)
      flash[:success] = 'Workout was successfully updated.'
      redirect_to edit_workout_path(@workout)
    else
      flash.now[:error] = 'An error occurred. Please correct the issues on the form and resubmit.'
      render :edit
    end
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

  def edit_workout_params
    params.require(:workout).permit(:name, :start_at, :end_at)
  end
end
