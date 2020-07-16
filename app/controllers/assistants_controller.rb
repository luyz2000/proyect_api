class AssistantsController < ApplicationController
  before_action :set_assistant, only: [:show, :update, :destroy]
  before_action :authenticate_user!,only: [:create, :update, :destroy]

  # GET /api/assistants
  def index
    @assistants = Assistant.all.paginate(page: params[:page], per_page: 100)

    render json: @assistants
  end

  # GET /api/assistants/1
  def show
    render json: @assistant
  end

  # POST /api/assistants
  def create
    @assistant = Assistant.new(assistant_params)

    if @assistant.save
      render json: @assistant, status: :created, location: @assistant
    else
      render json: @assistant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/assistants/1
  def update
    if @assistant.update(assistant_params)
      render json: @assistant
    else
      render json: @assistant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/assistants/1
  def destroy
    @assistant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assistant
      @assistant = Assistant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def assistant_params
      params.require(:assistant).permit(:name, :address, :phone, :group, :image)
    end
end
