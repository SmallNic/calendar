class InvitesController < ApplicationController

  def accept
    @calendar = Calendar.find(params[:calendar_id])
    user_calendar = UsersCalendar.new()
    user_calendar.user = current_user
    user_calendar.calendar = @calendar
    user_calendar.save
    invite = Invite.find_by(calendar_id:@calendar.id, recipient:current_user.id)
    invite.destroy
    redirect_to calendars_path
  end


  def decline
    invite = Invite.find_by(calendar_id:@calendar.id, recipient:current_user.id)
    invite.destroy
    redirect_to calendars_path
  end

end
