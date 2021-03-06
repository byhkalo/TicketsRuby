class EventsController < ApplicationController

  before_action :set_event, only: [:show]
  before_action :check_logged_in, only: [:new, :create]

  def index
  	@events = Event.all
  end

  def show
    @tickets = Ticket.where(event_id: @event.id)
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def set_event
      @event = Event.find(params[:id])
  end

  def event_params
      params.require(:event).permit(:artist, :description, :price_low, :price_hight, :event_date)
  end

private
  def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username, password|
    username == "admin" && password == "admin" end
  end
end
