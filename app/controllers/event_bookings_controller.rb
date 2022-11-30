class EventBookingsController < ApplicationController
  def create
    @event_booking = EventBooking.find_or_initialize_by(user_id: event_booking_params[:user_id],
                                                        event_id: event_booking_params[:event_id])
    @event_booking.status = event_booking_params[:status]

    if @event_booking.save
      flash.notice = "#{@event_booking.status}!"
    else
      flash.alert = 'Uh oh!'
    end
    redirect_back fallback_location: event_path(event_booking_params[:event_id])
  end

  def update
    @event_booking = EventBooking.find(params[:id])

    if @event_booking.update(event_booking_params)
      flash.notice = "#{@event_booking.status}!"
    else
      flash.alert = 'Uh oh!'
    end
    redirect_back fallback_location: event_path(event_booking_params[:event_id])
  end

  def destroy
    EventBooking.destroy(params[:id])

    flash.notice = 'Removed booking'
    redirect_back fallback_location: event_path(event_booking_params[:event_id])
  end

  private

  def event_booking_params
    params.require(:event_booking).permit(:status, :user_id, :event_id)
  end
end
