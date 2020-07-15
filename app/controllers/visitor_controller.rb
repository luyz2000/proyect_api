class VisitorController < ApplicationController
  include ActionController::MimeResponds
  include ActionView::Layouts
  include ActionController::Rendering

  def index
    respond_to do |format|
      format.html { render :index }
    end
  end

  def activity_logs
    @activity_logs = ActivityLog.includes(:baby, :assistant, :activity).all.order(start_time: :desc)
    @options_babies = @activity_logs.collect{|act| [act.baby.name.titleize, act.baby.id] }.uniq
    @options_assistant = @activity_logs.collect{|act| [act.assistant.name.titleize, act.assistant.id] }.uniq

    filter_params(params).each do |key, val|
      @activity_logs = @activity_logs.public_send("filter_#{key}", val) if val.present?
    end

    @activity_logs = @activity_logs.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html { render :activity_logs }
    end
  end

  private
  def filter_params(params)
    params.slice(:baby, :assistant, :status)
  end

end
