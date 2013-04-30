require 'spec_helper'

describe Event do
  before(:each) do
    @attr = { :description => "some event", 
              :day_of_mounth => 20, 
              :start_date => Date.new(2013, 1,1),
              :day1 => 1}
  end

  it "should create a new instance given valid attributes" do
    Event.create!(@attr)
  end

  it "should return events of day: mounth day and week's day" do 
    #create event for some date
    day_event = Event.create!(@attr)
    Event.date_event(Date.new(2013, 4, 20)) != []
  end

  it "should return all active events" do
    some_event = Event.create!(@attr)
    Event.get_active_events(Date.new(2013, 4, 20)) != []
  end

  it "should return true if day of week is true" do
    some_event = Event.create!(@attr)
    some_event.in_day_of_week(1) == true
  end

  it "should return false if day of week is no true" do
    some_event = Event.create!(@attr.merge(:day1=>""))
    some_event.in_day_of_week(1) == false
  end

  it "should return array of date for current event" do
  end
end
