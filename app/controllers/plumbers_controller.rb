class PlumbersController < ApplicationController
    before_action :set_plumber, only: [:show, :update, :destroy]

  def index
    @plumbers = Plumber.all
    render json: @plumbers
  end

  def show
    render json: @plumber
  end

  def create
    @plumber = Plumber.new(plumber_params)
    if @plumber.save
      render json: @plumber, status: :created
    else
      render json: { errors: @plumber.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @plumber.update(plumber_params)
      render json: @plumber, status: :ok
    else
      render json: { errors: @plumber.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @plumber.destroy
    head :no_content
  end

  private

  def set_plumber
    @plumber = Plumber.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Plumber not found' }, status: :not_found
  end

  def plumber_params
    params.require(:plumber).permit(:name, :email, :phone_number, :location, :specialization, :pricing, :start_rating)
  end
end
