class Azantime
	attr_reader :fajr,:sunrise,:dhuhr,:sunset,:maghrib
	def initialize(fajr,sunrise,dhuhr,sunset,maghrib)
		@fajr,@sunrise,@dhuhr,@sunset,@maghrib = fajr,sunrise,dhuhr,sunset,maghrib
	end
end