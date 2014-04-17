require 'rubygems'
require 'net/http'
require 'json'
require 'azan_time'
require 'prayer_time_methods' 
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include PrayerTimeMethods
end
