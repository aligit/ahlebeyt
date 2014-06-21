class EventsController < ApplicationController
  respond_to :json
  before_action :set_languages, only: [:new,:edit,:create,:update]
  before_action :authenticate_user!, except: [:upcomings,:index]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all.reverse
    respond_to do |format|
      format.html # index.html.erb
    end

  end

  def upcomings
    @upcoming = Event.get_upcoming_events

   #  Respond to request with post data in json format
    respond_with(@upcoming) do |format|
      format.json { render :json => @upcoming.as_json }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    def set_languages
      @languages = Rails.application.config.ab_languages
    end

    def event_params
      params.require(:event).permit(:title, :body, :startdate, :enddate, :location, :speaking_languages => [])
    end
end
