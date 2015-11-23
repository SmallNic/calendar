class CalendarsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @calendars = Calendar.where()
    user_calendars = UsersCalendar.where(user_id:current_user.id).pluck(:calendar_id)
    @calendars = Calendar.where(id:user_calendars)

    @invites = Invite.where(recipient:current_user.id)
  end

  def new
    @calendar = Calendar.new
  end

  def create
    binding.pry
    @calendar = Calendar.new(calendar_params)
    @calendar.save
    user_calendar = UsersCalendar.new()
    user_calendar.user = current_user
    user_calendar.calendar = @calendar
    user_calendar.save
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
