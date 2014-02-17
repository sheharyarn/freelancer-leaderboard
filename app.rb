#############################################################
VER = 	"Freelancer App (by Team DesignLife)"       #########
#############################################################

system('clear')
require 'json'
require 'rest-client'
require 'terminal-table'


URL = "https://scavenger.freelancer.com/data_dynamic"


class String
	# Colorization
	def colorize(color_code)
		"\e[#{color_code}m#{self}\e[0m"
	end

	def black;			colorize(30);	end
	def red;			colorize(31);	end
	def green;			colorize(32);	end
	def yellow;			colorize(33);	end
	def blue;			colorize(34);	end
	def magenta;		colorize(35);	end
	def cyan;			colorize(36);	end
	def gray;			colorize(37);	end

	def bg_black;       colorize(40);	end
	def bg_red;         colorize(41);	end
	def bg_green;       colorize(42);	end
	def bg_brown;       colorize(43);	end
	def bg_blue;        colorize(44);	end
	def bg_magenta;     colorize(45);	end
	def bg_cyan;        colorize(46);	end
	def bg_gray;        colorize(47);	end
	
	def bold;           colorize(1);	end
	def reverse_color;  colorize(7);	end
end


### MAIN CODE STARTS HERE

puts("#########################################################################\n##     ".gray + VER.bold.yellow + "                    ###########\n#########################################################################\n".gray)

puts "Fetching Data from".gray + " Freelancer.com ".bold.blue + "...\n\n".gray

res = JSON.parse RestClient.get(URL)


table = Terminal::Table.new :title => "Leaderboard".red.bold, :headings => ["Rank".bold.blue, "Team Name".bold.blue, "Score".bold.blue]
res['leaders'].each do |lead|
	table.add_row([
        lead['rank'].to_s.yellow.bold,
        lead['name'].to_s,
        lead['score'].to_s
    ])
end

puts table
puts "\n\nBy:" + " Team DesignLife\n\n".bold.blue