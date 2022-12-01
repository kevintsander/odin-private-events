class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @invite_booking = @event.event_bookings.build
  end

  def edit; end

  def update
    if @event.update(event_params)
      flash.notice = 'Event updated!'
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.destroy
      flash.notice = 'Event deleted!'
      redirect_to events_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :location, :description, :date, :invite_only)
  end
end
