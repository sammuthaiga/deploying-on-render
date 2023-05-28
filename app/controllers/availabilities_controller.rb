class AvailabilitiesController < ApplicationController
    before_action :set_plumber
  before_action :set_availability, only: [:show, :update, :destroy]

  def index
    @availabilities = @plumber.availabilities
    render json: @availabilities
  end

  def show
    render json: @availability
  end

  def create
    @availability = @plumber.availabilities.build(availability_params)
    if @availability.save
      render json: @availability, status: :created
    else
      render json: @availability.errors, status: :unprocessable_entity
    end
  end

  def update
    if @availability.update(availability_params)
      render json: @availability
    else
      render json: @availability.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @availability.destroy
    head :no_content
  end

  private

  def set_plumber
    @plumber = Plumber.find(params[:plumber_id])
  end

  def set_availability
    @availability = @plumber.availabilities.find(params[:id])
  end

  def availability_params
    params.require(:availability).permit(:available, :expected_available_date)
  end
end
