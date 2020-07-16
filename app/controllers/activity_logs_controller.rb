class ActivityLogsController < ApplicationController
  before_action :set_activity_log, only: [:show, :update, :destroy]
  before_action :authenticate_user!,only: [:create, :update, :destroy]
  include ActionController::MimeResponds
  include ActionView::Layouts
  include ActionController::Rendering

  # GET /api/activity_logs and /activity_logs for html
  def index
    if api_request?
      @activity_logs = ActivityLog.all.paginate(page: params[:page], per_page: 100)
    else
      @activity_logs = ActivityLog.includes(:baby, :assistant, :activity).all.order(start_time: :desc)
      @options_babies = @activity_logs.collect{|act| [act.baby.name.titleize, act.baby.id] }.uniq
      @options_assistant = @activity_logs.collect{|act| [act.assistant.name.titleize, act.assistant.id] }.uniq
      @activity_logs = @activity_logs.paginate(page: params[:page], per_page: 10)
    end

    filter_params(params).each do |key, val|
      @activity_logs = @activity_logs.public_send("filter_#{key}", val) if val.present?
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @activity_logs }
    end

  end

  # GET /api/activity_logs/1
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @activity_log }
    end
  end

  # POST /api/activity_logs
  def create
    @activity_log = ActivityLog.new(activity_log_params)

    if @activity_log.save
      render json: @activity_log, status: :created, location: @activity_log
    else
      render json: @activity_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/activity_logs/1
  def update
    if @activity_log.update(activity_log_params)
      render json: @activity_log
    else
      render json: @activity_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/activity_logs/1
  def destroy
    @activity_log.destroy
  end

  private
    def api_request?
      request.format.json? || request.format.xml?
    end

    def filter_params(params)
      params.slice(:baby, :assistant, :status)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_activity_log
      @activity_log = ActivityLog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def activity_log_params
      params.require(:activity_log).permit(:baby_id, :assistant_id, :activity_id, :start_time, :stop_time, :duration, :name, :comments, :image)
    end
end
