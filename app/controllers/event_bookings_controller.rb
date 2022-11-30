class EventBookingsController < ApplicationController
  before_action :set_event
  before_action :check_allowed_status, only: [:update]

  def update
    @event_booking.status = event_booking_params[:status]

    if @event_booking.save
      flash.notice = "#{@event_booking.status}!"
    else
      flash.alert = 'Uh oh!'
    end
    redirect_back fallback_location: event_path(params[:event_id])
  end

  def destroy
    @event_booking.destroy

    flash.notice = 'Removed booking'
    redirect_back fallback_location: event_path(params[:event_id])
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
    @event_booking = @event.event_bookings.find_or_initialize_by(user_id: params[:id])
  end

  def check_allowed_status
    return if @event_booking.allowed_status?(event_booking_params[:status], current_user)

    flash.alert = 'Invalid status!'
    redirect_back fallback_location: event_path(params[:event_id])
  end

  def event_booking_params
    params.require(:event_booking).permit(:status)
  end
end
