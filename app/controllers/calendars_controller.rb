class CalendarsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @calendars = Calendar.all
  end

  def new
    @calendar = Calendar.new
  end

  def create
    binding.pry
    @calendar = Calendar.new(calendar_params)
    @calendar.save
    redirect_to new_calendar_event_path(@calendar)
  end

  def show
    @calendar = Calendar.find(params[:id])
  end


  private

  def calendar_params
    params.require(:calendar).permit(:name, :color)
  end

end
