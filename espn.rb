require 'HTTParty'
require 'Nokogiri'
#require 'CSV'

#url = "https://games.espn.com/ffl/clubhouse?leagueId=1136194&teamId=1&seasonId=2016"

#url = "https://games.espn.com/ffl/standings?leagueId=1136194&seasonId=2016"

url_1 = "https://games.espn.com/ffl/clubhouse?leagueId=1136194&teamId="
url_2 = "&seasonId=2016"

i = 1

players = []

test = []

#=begin

while i < 9 do
	url = url_1 + "%d" %i + url_2
	page = HTTParty.get(url)
	parse_page = Nokogiri::HTML(page)

	players = []
	test = []

	owner = parse_page.css('.per-info').text
	team = parse_page.css('.team-name').text

	players.push(owner)
	players.push(team)

	owner = owner.split()[0].downcase
	#print owner

	parse_page.css('.playertablePlayerName').map do |a|
		player = a.text
		players.push(player)
	end

	parse_page.css('.playertableData').map do |a|
		prk = a.text
		test.push(prk)
	end

	new_players = []
	new_players[0] = players[0]	
	new_players[1] = players[1]

	(5..85).step(5) do |x|

		add = " (PRK: " + test[x] + ")" 

		if x == 50
			next
		end
		if x > 50
			new_players[x/5] = players[x/5] + add
		else
			new_players[x/5+1] = players[x/5+1] + add
		end
	end

	#puts new_players

	#puts players

	File.open(owner+".txt", "w") do |f|
  		f.puts(new_players)
	end

	i += 1
end
#=end

=begin
url = url_1 + "1" + url_2

page = HTTParty.get(url)
	parse_page = Nokogiri::HTML(page)

players = []

	players.push(parse_page.css('.per-info').text)
	players.push(parse_page.css('.team-name').text)

	parse_page.css('.playertablePlayerName').map do |a|
		player = a.text
		players.push(player)
	end
=end

#print parse_page.css('.per-info').text
#print parse_page.css('.team-name').text

#puts players

#string = "Paulo Nascimento"
#print string.split()[0]



#puts teams