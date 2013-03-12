class DestinationsController < ApplicationController

  def index
    @trip = Trip.find(params[:trip_id])
    @destinations = Destination.all
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.find(params[:id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.new
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.find(params[:id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.new(params[:destination])

    if @destination.save
      redirect_to [@trip, @destination], notice: 'Destination was successfully created.' 
    else
      render action: "new" 
    end
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.find(params[:id])

    if @destination.update_attributes(params[:destination])
      redirect_to @trip, notice: 'Destination was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
    @trip = Trip.find(params[:trip_id])

    redirect_to trip_destinations_url 
  end

end
