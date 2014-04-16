class EventDay
  attr_accessor :day, :description, :event_id
end

class Event < ActiveRecord::Base
  attr_accessible :day_of_mounth, :day1, :day2, :day3, :day4, :day5, :day6, :day7, :day_of_week, :description, :end_date, :start_date

  def self.date_event(some_date)
    if some_date.class != Date
      return
    end
    m_day = some_date.day ||= "NULL"
    w_day = some_date.days_to_week_start ||= "NULL"
    #querty_text = "day_of_mounth = ? AND day_of_week = ? "
    Event.where("day_of_mounth = ? AND day_of_week = ? AND start_date <= ?", m_day, w_day, some_date)
  end

  def self.get_active_events(on_date)
    Event.where("start_date <= ? AND (end_date >= ? OR end_date IS NULL)", on_date, on_date)
  end

  def date(date_of_month)
    beginninig_date = date_of_month.beginning_of_month
    end_date        = date_of_month.end_of_month
    days_of_event = []
    for cur_day in beginninig_date..end_date
      cur_date = Date.new(date_of_month.year, date_of_month.month, cur_day)
      if self.day_of_mounth == cur_day
        days_of_event.push(EventDay.new(:day => cur_date, :description => self.description, :event_id => self))
      elsif self.day_of_week == cur_date.days_to_week_start + 1
        days_of_event.push(cur_date)
      end
    end
    return days_of_event
  end

  def in_day_of_week(weeks_day)
    # ans = false
    # case (weeks_day)
    #   when 1 then ans = true if self.day1 != 0
    #   when 2 then ans = true if self.day2 != 0
    #   when 3 then ans = true if self.day3 != 0
    #   when 4 then ans = true if self.day4 != 0
    #   when 5 then ans = true if self.day5 != 0
    #   when 6 then ans = true if self.day6 != 0
    #   when 7 then ans = true if self.day7 != 0
    # end
    #return ((weeks_day > 0) and (weeks_day < 8)) if self["day#{weeks_day}"] != 0
    return self["day#{weeks_day}"] != 0
  end

  def self.events_days(beginninig_date, end_date)
    events = Event.get_active_events(beginninig_date)
    events_days = []
    for event in events do
      for cur_day in beginninig_date..end_date
        #puts "Year #{beginninig_date.year} - #{beginninig_date.month} - #{cur_day}"
        #cur_date = Date.new(beginninig_date.year, beginninig_date.month, cur_day)
        if (event.day_of_mounth == cur_day.day) or event.in_day_of_week(cur_day.days_to_week_start + 1)
          #events_days.push(EventDay.new(:day => cur_day, :description => event.description, :event_id => event))
          ev1 = EventDay.new #(:day => cur_day, :description => event.description, :event_id => event)
          ev1.day = cur_day
          ev1.description = event.description
          ev1.event_id = event
          events_days.push(ev1)
        end
      end
    end
    return events_days
  end


end
