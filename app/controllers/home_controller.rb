class HomeController < ApplicationController
	def index
		@prayertimes = get_today_prayer_times
	end
	def about
	end
	def contact
	end
	def event
	end
	def don
	end
end
