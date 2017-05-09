class WorkoutsController < ProtectedController
  before_action :set_workout, only: [:show, :update, :destroy]
  before_action :validate_user
  # GET /workouts
  def index
    # @workouts = Workout.all
    @workouts = current_user.workouts.all

    render json: @workouts
  end

  # GET /workouts/1
  def show
    render json: @workout
  end

  # POST /workouts
  def create
    @workout = current_user.workouts.build(workout_params)
    # @workout.user_id = @current_user.id

    if @workout.save
      render json: @workout, status: :created, location: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workouts/1
  def update
    if @workout.update(workout_params)
      render json: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workouts/1
  def destroy
    @workout.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_workout
    # @workout = Workout.find(params[:id])
    @workout = current_user.workouts.find(params[:id])
  end

  def validate_user
    set_current_user
  end

  # Only allow a trusted parameter "white list" through.
  def workout_params
    params.require(:workout).permit(:name, :reps, :sets)
  end
end
