module PrayerTimeMethods
	
HOME_URL = 'praytime.info'
SERVICE = '/getprayertimes.php?'

	def get_today_prayer_times
		@today = Date::today
		day = @today.day.to_s
		month = "&m=#{@today.month.to_s}"
		year = "&y=#{@today.year.to_s}"
		geographical_params = get_prayer_city_params("geneva")
		response_JSON = JSON.parse(Net::HTTP.get(HOME_URL,SERVICE+geographical_params+month+year))
		azan_JSON = response_JSON[day]
		prayertimes = Azantime.new(azan_JSON["Fajr"],azan_JSON["Sunrise"],azan_JSON["Dhuhr"],azan_JSON["Sunset"],azan_JSON["Maghrib"])
		return prayertimes
		#return azan_JSON
    end 

	def get_prayer_city_params(city)
		lat = "lat=#{get_city_lat(city)}"
		long = "lon=#{get_city_long(city)}"
		timezone = "gmt=#{get_gmt_offset(city)}"
		school = "school=6"
    # binding.pry
		#Parameters related to Shia Ithna-Ashari, Leva institute, Qum 
		#school_params = "&params=16,4,14.0,0,0,0,0,1,0,0"

		#Parameters related to Institute of Geophysics, University of Tehran
		#Fajr=17.7;Maghrib=4.5;Isha=14;
		school_params = "params=17.7,4.5,14.0,0,0,0,0,1,0,0"

		parameters = "#{lat}&#{long}&#{timezone}&#{school}&#{school_params}"
		return parameters
    end 

	def get_city_lat(city)
		#Default for geneva
		return 46.1983922.to_s
    end 

	def get_city_long(city)
		#Default for geneva
		return 6.1422961.to_s
    end 

	def get_gmt_offset(city)
		#Default for geneva
    #Depends on TZInfo gem which is by default included in Rails4
    app_time_zone = Rails.application.config.time_zone
    timezone = TZInfo::Timezone.get(app_time_zone)
    current_period = timezone.current_period
    # gmt or utc offset in minutes
    gmt_offset = current_period.utc_total_offset/60
		return gmt_offset.to_s
 end
end
