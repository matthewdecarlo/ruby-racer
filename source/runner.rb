Logo = %q"
 ______      ____                                    __      
/\  _  \    /\  _`\                                 /\ \__   
\ \ \L\ \   \ \ \/\ \     __     __  __         __  \ \ ,_\  
 \ \  __ \   \ \ \ \ \  /'__`\  /\ \/\ \      /'__`\ \ \ \/  
  \ \ \/\ \   \ \ \_\ \/\ \L\.\_\ \ \_\ \    /\ \L\.\_\ \ \_ 
   \ \_\ \_\   \ \____/\ \__/.\_\\/`____ \   \ \__/.\_\\ \__\
    \/_/\/_/    \/___/  \/__/\/_/ `/___/> \   \/__/\/_/ \/__/
                                     /\___/                  
                                     \/__/                   
 __    __                  ____                                     
/\ \__/\ \                /\  _`\                                   
\ \ ,_\ \ \___      __    \ \ \L\ \     __      ___     __    ____  
 \ \ \/\ \  _ `\  /'__`\   \ \ ,  /   /'__`\   /'___\ /'__`\ /',__\ 
  \ \ \_\ \ \ \ \/\  __/    \ \ \\ \ /\ \L\.\_/\ \__//\  __//\__, `\
   \ \__\\ \_\ \_\ \____\    \ \_\ \_\ \__/.\_\ \____\ \____\/\____/
    \/__/ \/_/\/_/\/____/     \/_/\/ /\/__/\/_/\/____/\/____/\/___/ 

"

require_relative 'ruby_racer'

players = ['🐸', '🐨', '🐵', '🐯', '🐱', '🐭', '🐹', '🐰', '🐶']
length = 17
new_game = RubyRacer.new(players, length)



until new_game.finished?
	print Logo
    new_game.display_board
    new_game.advance_players!(new_game)
	sleep(0.5)
	new_game.reset_screen!
end

print Logo
new_game.display_board
puts
puts "#{new_game.winner}  has won!"
puts
