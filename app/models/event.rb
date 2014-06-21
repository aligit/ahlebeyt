class Event < ActiveRecord::Base
  validates :title, :presence => true
  validates :body, :presence => true

  def self.get_upcoming_events
    upcoming_events = where("startdate >= ?", Time.zone.now.beginning_of_day).order('startdate ASC').limit(4)
    if(!upcoming_events.empty?)
      return upcoming_events
    else
      return where("enddate < ?", Time.zone.now.beginning_of_day).order('enddate DESC').limit(1)
    end
  end
end
