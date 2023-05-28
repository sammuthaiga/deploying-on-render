class ServicesController < ApplicationController
    before_action :set_service, only: [:show, :update, :destroy]

  def index
    @services = Service.all
    render json: @services
  end

  def show
    render json: @service
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      render json: @service, status: :created
    else
      render json: { errors: @service.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @service.update(service_params)
      render json: @service
    else
      render json: { errors: @service.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
    render json: { message: 'Service deleted successfully' }
  end

  private

  def set_service
    @service = Service.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Service not found' }, status: :not_found
  end

  def service_params
    params.require(:service).permit(:name, :description)
  end
end
