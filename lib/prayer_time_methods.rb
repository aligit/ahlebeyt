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
		timezone = "gmt=#{get_city_timezone(city)}"
		school = "school=6"
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

	def get_city_timezone(city)
		#Default for geneva
		return 60.to_s
    end 
end
