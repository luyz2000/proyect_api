class VisitorController < ApplicationController
  include ActionController::MimeResponds
  include ActionView::Layouts
  include ActionController::Rendering

  def index
    respond_to do |format|
      format.html { render :index }
    end
  end

end
