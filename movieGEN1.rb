require_relative 'movie'
require_relative 'schedule'

# Load
file = File.read(ARGV[0])
# Storage
movieObjs = []
# Create Array
movies = file.lines
movies.shift
# Create Objects
movies.each do |m|
	details = m.split(",")
	newMovie = Movie.new
	newMovie.title = details[0] 
	newMovie.year = details[1]
	newMovie.rating = details[2]
	newMovie.duration = details[3]
	sometime = details[3].split(":")
	newMovie.hour = sometime[0]
	newMovie.minute = sometime[1]
	movieObjs.push(newMovie)
end
# -------------------------

def schedule_movie movie
	open_time = Time.new(2016,"dec",1,10,00,00)
	close_time = Time.new(2016,"dec",1,24,00,00)

	current_time = setup(open_time)
	duration = get_duration(movie)

	schedule = Schedule.new
	header = "#{movie.title} - Rated #{movie.rating}, #{movie.duration}"
	schedule.header = header

	showings = create_showings(current_time, close_time, duration)

	schedule.showings = showings
	
	puts
	puts schedule.header
	puts schedule.showings
end

def create_showings current_time, close_time, duration
	showings = []
	time = current_time
	while check_availability(time, close_time, duration) do
		showing = create_a_showing(time, close_time, duration)
		time = time + duration
		time = clean_up(time)
		showings.push(showing)
	end

	return showings
end

def create_a_showing current_time, close_time, duration
		end_time = current_time + duration

		start_time = current_time.strftime("%I:%M%p")
		end_time = end_time.strftime("%I:%M%p")

		showing = "#{start_time} - #{end_time}"
		return showing
end

def get_duration movie
	hours_to_minutes = movie.hour.to_i * 60
	minutes = hours_to_minutes.to_i + movie.minute.to_i
	duration = minutes * 60
	return duration
end

def check_availability currentTime, closingTime, duration
	if currentTime < closingTime
		endTime = currentTime + duration
		if endTime < closingTime
			return true
		else
			return false
		end
	end
end

def setup time
	setup_time = time + 60*60
	return setup_time
end

def clean_up time
	ready_time = time + 35*60
	return ready_time
end

# Do The Stuff
movieObjs.each do |m|
	schedule_movie(m)
end