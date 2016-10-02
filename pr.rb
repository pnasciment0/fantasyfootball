require "google_drive"

#log into Google Drive
session = GoogleDrive::Session.from_config("config.json")

#extract second sheet
scores = session.spreadsheet_by_title("Fantasy Team Rosters").worksheets[1]

pr = session.spreadsheet_by_title("Fantasy Team Rosters").worksheets[2]

if ARGV.empty?
	puts "Usage: ruby pr.rb [x], where x is current week"
	exit
else
	v = ARGV[0]
end

(3..10).each do |x|
	pr[x-1,v.to_i+1] = scores[x,11]
end

pr.save