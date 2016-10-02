Contained in this repository:

<ul>
<li><b>espn.rb</b>: Loops over 8 ESPN Fantasy Football Clubhouse IDs. Uses the Nokogiri and HTTParty gems to webscrape HTML from the ESPN urls given by the Clubhouse IDs. For each team, scrapes the list of all the players, as well as the owner of that team and the team's name. It will also scrape stats for each of the players. It returns that information in a file named [owner].txt, where [owner] is the first name of the team's owner. The script altogether updates 8 .txt files, or makes them if they do not already exist.</li>

<li><b>drive.rb</b>: Uses the google_drive gem and the Google Drive API to log onto a spreadsheet. It reads the 8 text files made above.  For each file, it loops over the list of players and puts the list in its own column in a Google Drive spreadsheet.</li>

<li><b>scores.rb</b>: Uses Nokogiri and HTTParty gems again. Takes a command line argument for the current week of the fantasy football season (0-12, inclusive). Uses this argument to generate a URL for the ESPN Fantasy League Scoreboard page. Webscrapes HTMl from the page to return an array of the player IDs and another array of the fantasy scores. The end goal for this Ruby script is to update every team's scores on a weekly basis, so it will be run each week from 0-12. The spreadsheet is sort in alphabetical order, so the script sorts the array of player IDs in alphabetical order and uploads that player's score to the corresponding column on the spreadsheet, and the row is a function of the command line argument. Usage: ruby scores.rb [x], where x is 0-12.</li>

<li><b>pr.rb</b>: This script also takes a command line argument and accesses a spreadsheet using the Google Drive API. The spreadsheet ranks each of the 8 teams in order of average points per game. This script takes a "snapshot" of that week's ranking and saves them in another sheet so that one can see how each player's position in the power ranking changes week to week.

</ul>

The whole repository can be thought of as a suite of Ruby scripts to further enhance the Fantasy Football experience. From compiling a spreadsheet of every player's roster to pulling everyone's scores into a spreadsheet, it aims to encompass a variety of useful functions for both commissioners and players of an ESPN Fantasy Football league.
