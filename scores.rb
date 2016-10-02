require "google_drive"
require "HTTParty"
require "Nokogiri"

# ==== Logs into Google Drive

session = GoogleDrive::Session.from_config("config.json")

ss = session.spreadsheet_by_title("Fantasy Team Rosters").worksheets[1]

# ==== URL of the FF Scoreboard page

url_1 = "https://games.espn.com/ffl/scoreboard?leagueId=1136194&matchupPeriodId="

#i = 1

url_2 = "&seasonId=2016"

if ARGV.empty?
	puts "Usage: ruby scores.rb [x], where x is current week"
	exit
else
	v = ARGV[0]
end

#puts url_1 + "%d" %v + url_2

url = url_1 + "%d" %v + url_2

page = HTTParty.get(url)

parse_page = Nokogiri::HTML(page)

players = []

scores = []

parse_page.css('span.abbrev').map do |a|
	player = a.text
	#print player
	player = player.tr('()', '')
	players.push(player)
end

parse_page.css('.score').map do |a|
	player = a.text
	#print player
	scores.push(player)
end

updated = []

#scores = [0,0,0,0,0,0,0,0]

puts scores
puts players

n = players.length - 1

(0..n).each do |x|
	updated.push(players[x] + " - " + scores[x].to_s)
end

updated = updated.sort!

scores = []
players = []

puts updated

(0..n).each do |x|
	ch = updated[x].split("- ")[1]
	sh = updated[x].split(" -")[0]
	scores.push(ch)
	players.push(sh)
end	

(0..7).each do |x|
	ss[1,x+2] = players[x]
end

(0..7).each do |x|
	ss[v.to_i+1,x+2] = scores[x]
end

ss.save