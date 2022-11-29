class EventAttendeesController < ApplicationController
  def update
    event = Event.find(params[:id])
    if event.attendees.where(id: current_user.id).any?
      flash.alert = 'Already attending!'
      redirect_to event_path(event)
    else
      event.attendees << current_user

      flash.notice = 'Thanks for attending!'
      redirect_to event_path(event)
    end
  end

  def destroy
    event = Event.find(params[:id])
    attendee = User.find(params[:user_id])
    event.attendees.delete(attendee)

    flash.notice = 'Removed attendee'
    redirect_to event_path(params[:id])
  end
end
