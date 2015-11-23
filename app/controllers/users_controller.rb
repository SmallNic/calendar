class UsersController < ApplicationController

  def search
    # binding.pry
    calendar = Calendar.find(params[:calendar_id])
    recipient = User.find_by(email:params[:email])
    if recipient && calendar
      invite = Invite.create(user_id:current_user.id, recipient:recipient.id, calendar_id:calendar.id, status:"open")
      recipient.open_invite = true
      recipient.save
    end
    redirect_to calendar_path(calendar)
  end



end
