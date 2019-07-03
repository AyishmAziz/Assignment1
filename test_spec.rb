require_relative 'calendar'

describe Calendar do 
	before(:all) do
		hash = Hash.new
	    @events = Calendar.new(hash)
	    @string = "20191117"
	    @name = "event1"
	    @desc = "description1"
	    @date = Date.parse(@string)
	end
	
	it "should return string = Event added successfully" do 
		expect(@events.addEvent(@date,@name,@desc)).to eq "Event added successfully"
	end

	it "shoud return string = Event not found" do
		n = "new event"
		expect(@events.removeEvent(@date,n)).to eq "Event not found"
	end

	it "should return string = Event updated" do 
		new_name = "event2"
		new_desc = "abcd"
		expect(@events.editEvent(@date,@name,new_name,new_desc)).to eq "Event updated"
	end

	it "shoud return string = Event Removed" do
		new_name = "event2"
		expect(@events.removeEvent(@date,new_name)).to eq "Event Removed"
	end

	it "should return string = Event not found" do 
		new_name = "new event"
		new_desc = "abcd"
		expect(@events.editEvent(@date,@name,new_name,new_desc)).to eq "Event not found"
	end

	it "should return nil" do
		expect(@events.print_event_details(@date)).to eq nil
	end

	it "should return nil" do
		expect(@events.print_month_details(@date)).to eq nil
	end
	
end