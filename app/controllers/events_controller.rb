class EventsController < ApplicationController

  def index
    @type_period = params[:type_period].to_i ||= 0 # 0 - month, 1- week, 2 -day
    if @type_period == 0
      @date = params[:month] ? Date.parse(params[:month]) : Date.today
      per = "month"
    elsif @type_period == 1
      @date = params[:week] ? Date.parse(params[:week]) : Date.today
      per = "week"
    elsif @type_period == 2
      @date = params[:day] ? Date.parse(params[:day]) : Date.today
      per = "day"
    end
    if @type_period == 2
      start_val = @date
      end_val   = @date
    else
      start_val = @date.method("beginning_of_#{per}").call
      end_val = @date.method("end_of_#{per}").call
    end
    @events = Event.events_days( start_val, end_val )
  end

  def create
    @event = Event.new(params[:event])

    if @event.save
      flash[:success] = "OK"
      redirect_to events_path
    else
      flash[:error] = "ERORR"
      redirect_to :new
    end
  end


  

  def new
    @event = Event.new
  end
end
