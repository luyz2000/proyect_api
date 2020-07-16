class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :update, :destroy]
  before_action :authenticate_user!,only: [:create, :update, :destroy]

  # GET /api/activities
  def index
    @activities = Activity.all.paginate(page: params[:page], per_page: 100)

    render json: @activities
  end

  # GET /api/activities/1
  def show
    render json: @activity
  end

  # POST /api/activities
  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      render json: @activity, status: :created, location: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/activities/1
  def update
    if @activity.update(activity_params)
      render json: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/activities/1
  def destroy
    @activity.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def activity_params
      params.require(:activity).permit(:name, :description, :image)
    end
end
