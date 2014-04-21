class Event < ActiveRecord::Base
  validates :title, :presence => true
  validates :body, :presence => true

  def self.get_upcoming_events
      where("startdate >= ?", Time.zone.now.beginning_of_day).order('startdate ASC').limit(4)
  end
end
