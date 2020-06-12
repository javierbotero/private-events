class EventsController < ApplicationController
  before_action :required_user, only: [:new]

  def new
    @users = User.where.not(id: current_user.id)
  end

  def index
    @events = Event.all.order(created_at: :DESC)
  end

  def create
    event = current_user.events.build(event_params)
    users = User.where.not(id:current_user.id)
    if event.save && attendanse_params != ['0'] 
      flash[:success] = 'Event created successfully!'
      attendanse_params.each do |user|
        a = event.user_attendees.build(attendee_id: user.to_i)
        a.save
      end
      redirect_to event_path(event)
    else
      flash[:danger] = "Event didn't created!"
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @users = User.all
  end

  def update
    debugger
  end

  protected

  def event_params
    params.require(:event).permit(:title, :date, :description)
  end

  def attendanse_params
    params.require(:attendees)
  end
end
