require "google_drive"
require "CSV"

session = GoogleDrive::Session.from_config("config.json")

ss = session.spreadsheet_by_title("Fantasy Team Rosters").worksheets[0]

path = "/Users/paulo/Virtualenvs/machine-learning/"

owners = ["andrew", "henry", "paulo", "uk", "bryan", "thomas", "rohan", "aqib"]

players = []


(0..7).each do |d|
	
	np = path + owners[d] + ".txt"
	
	f = File.open(np, "r")

	f.each do |line|
		#puts line
		players.push(line)
	end

	f = File.open(np)
	num_rows = f.readlines.size
	#p num_rows

	(1..num_rows).each do |x|
		ss[x,d+1] = players[x-1]
	end

	players = []

end

ss.save

#======== junk code =========

#ws = session.spreadsheet_by_key("1IdUy4kxFvzXxNhmUaxaM7yDTxDC7cVznpOD2M57en3I").worksheets[0]

#p ws[2,1]
#ws[1,2] = "THE BIRD IS JONTRON"
#ws.save

=begin
(1..16).each do |d|
	p ws[d,1]
end
=end

#s = session.create_spreadsheet(title="Fantasy Team Rosters")

#path  = path + owners[0] + ".txt"

#print path

=begin
File.open(path).each do |line|
	players.push(line)
	#print line
end
=end

#(1..8).each do |d|
	#ss[1,d] = owners[d-1]
#end

#num_rows = f.readlines.size
	#puts num_rows

#puts players

#ss[1,1] = players[1]

#owners.each do |o|
#	puts path + o + ".txt"
#end

#ss[1,d+1] = players[1]

#puts owners[0]

#(d+1..num_rows).each do |x|
	#	ss[]
	#puts np

