<ul>
<li><b>espn.rb</b>: Loops over 8 ESPN Fantasy Football Clubhouse IDs. Uses the Nokogiri and HTTParty gems to webscrape HTML from the ESPN urls given by the Clubhouse IDs. For each team, scrapes the list of all the players, as well as the owner of that team and the team's name. It will also scrape stats for each of the players. It returns that information in a file named [owner].txt, where [owner] is the first name of the team's owner. The script altogether updates 8 .txt files, or makes them if they do not already exist.</li>

<li><b>lol.rb</b>: Uses the google_drive gem and the Google Drive API to log onto a spreadsheet. It reads the 8 text files made above.  For each file, it loops over the list of players and puts the list in its own column in a Google Drive spreadsheet.</li>

</ul>
