class TripsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :owns_trip, only: [:edit, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def create
    @trip = Trip.new(params[:trip])
    @trip.user = current_user

    if @trip.save
      redirect_to @trip, notice: 'Trip was successfully created.' 
    else
      render action: "new" 
    end
  end

  def update
    @trip = Trip.find(params[:id])

    if @trip.update_attributes(params[:trip])
      redirect_to @trip, notice: 'Trip was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    redirect_to trips_url
  end

  private
    def owns_trip
      if !user_signed_in? || current_user != Trip.find(params[:id]).user
        redirect_to trips_path, error: "You don't have access"
      end
    end
end
