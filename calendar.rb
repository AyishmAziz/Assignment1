require_relative 'event'
require 'date'

class Calendar
	attr_accessor :calendarHash

	def initialize(calendar)
		@calendarHash = calendar
	end

	def addEvent(date,e_name,e_desc)
		temp_event = Event.new(e_name,e_desc)
		if (!calendarHash.has_key?(date))
			calendarHash[date] ||= []
		end
			calendarHash[date] << temp_event
		"Event added successfully"
	end

	def removeEvent(date,e_name)
		if (calendarHash.has_key?(date))
			if (calendarHash[date].find{|x| x.name == e_name})
				calendarHash[date].reject! {|x| x.name == e_name}
				"Event Removed"
			else
				"Event not found"
			end
		else
			"Event not found"	
		end
	end

	def editEvent(date,old_name,new_name,new_desc)
		if (calendarHash.has_key?(date))
			temp_event = calendarHash[date].find {|x| x.name == old_name}
			if temp_event != nil
				temp_event.name = new_name
				temp_event.description = new_desc
				"Event updated"
			else
				"Event not found"
			end
		else
			"Event not found"
		end
	end

	def print_calendar(curr_date)
		next_month = curr_date >> 1
		puts "M\tT\tW\tTH\tF\tST\tS"
		space = 0;
		if (curr_date.tuesday?)
			space = 1
		elsif (curr_date.wednesday?)
			space = 2
		elsif (curr_date.thursday?)
			space = 3
		elsif (curr_date.friday?)
			space = 4
		elsif (curr_date.saturday?)
			space = 5
		elsif (curr_date.sunday?)
			space = 6
		end
		1.upto(space){print "\t"}
		curr_date.upto(next_month) do |date|
			event_num = 0
			if (calendarHash.has_key?(date))
				event_num = calendarHash[date].count
			end
			print date.strftime('%d')
			if (event_num > 0)
				print "(#{event_num})"
			end
			print "\t"	
			if (date.sunday?)
				puts 	
			end
		end
		puts
	end

	def print_event_details(date)
		if (calendarHash.has_key?(date))
			if (calendarHash[date].count == 0)
				puts "No event found"
			else
				calendarHash[date].each {|x| puts "Event name = #{x.name} and event description = #{x.description}"}
			end
		else
			puts "No event found"
		end
	end

	def print_month_details(date)
		next_month = date >> 1
		flag = 0
		date.upto(next_month) do |date|
			if (calendarHash.has_key?(date))
					calendarHash[date].each do
						|x| puts "Event name = #{x.name} and event description = #{x.description}"
						flag = 1
					end	
			end
		end
		if (flag == 0)
			puts "No event found"
		end
	end

end
