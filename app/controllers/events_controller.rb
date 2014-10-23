class EventsController < ApplicationController
	before_action :find_params, :only => [:show, :edit, :update, :destroy]

	def index
		@events = Event.page(params[:page]).per(5)
	end

	def show
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)

		if @event.save
			flash[:notice] = "event was successfully created"
			redirect_to events_url
		else
			render :action => :new
		end
		
	end

	def edit
	end

	def update
		if @event.update(event_params)
			flash[:notice] = "event was successfully updated"
			redirect_to event_url(@event)
		else
			render edit
		end
	end

	def destroy
		@event.destroy
		flash[:alert] = "event was successfully deleted"
		redirect_to events_url
	end

	private

	def  find_params
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:name, :description)
	end
end
