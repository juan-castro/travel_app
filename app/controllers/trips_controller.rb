class TripsController < ApplicationController

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
end
