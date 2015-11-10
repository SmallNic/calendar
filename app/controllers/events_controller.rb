class EventsController < ApplicationController

  before_filter :authenticate_user!

  def index

    @events = Events.all
  end

  def new
    # binding.pry
    @calendar = Calendar.find(params[:calendar_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    @calendar = Calendar.find(params[:calendar_id])
    redirect_to calendar_path(@calendar)
  end

  def edit
    @event = Event.find(params[:id])
    @calendar = Calendar.find(params[:calendar_id])
  end


  private

  def event_params
    params.require(:event).permit(:start_date, :end_date, :start_time, :end_time, :description, :calendar_id)
  end

end
