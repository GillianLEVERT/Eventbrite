class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @events = find_event
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.admin = current_user
    @event.event_picture.attach(params[:event_picture])
    if @event.save
      redirect_to event_path(@event.id), success: 'Votre event est crééeééeéée!'
    else
      redirect_to new_event_path, alert: 'You failed'
    end
  end

  private 

  def event_params
   params.permit(:start_date, :duration, :title, :description, :price, :location)
  end

end
