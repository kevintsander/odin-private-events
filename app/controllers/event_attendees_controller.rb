class EventAttendeesController < ApplicationController
  def update
    event = Event.find(params[:event_id])

    event_attendee = event.event_attendees.find_or_initialize_by(user_id: params[:id])
    status = event_attendee_params[:status]

    if event_attendee.status == status
      flash.alert = `Already #{status.downcase}!`
      redirect_to event_path(event)
    end

    event_attendee.status = status
    if event_attendee.save
      flash.notice = "#{status}!"
    else
      flash.alert = 'Uh oh!'
    end
    redirect_to event_path(event)
  end

  def destroy
    event = Event.find(params[:event_id])
    event.event_attendees.delete_by(user_id: params[:id])

    flash.notice = 'Removed attendee'
    redirect_to event_path(params[:event_id])
  end

  private

  def event_attendee_params
    params.require(:event_attendee).permit(:status)
  end
end
