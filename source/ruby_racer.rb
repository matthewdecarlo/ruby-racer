require "awesome_print"
require_relative 'die.rb'

class RubyRacer
  attr_accessor :race_track
  attr_reader :players, :length, :players_array


  def initialize(players, length = 30)
    @players = players
    @length = length
    @players_array = []
    @race_track = []

    players.each do |player_name|
      a_player = "@player_and_pos_#{player_name}"
      players_array << set_player(a_player, {"#{player_name}" => 0}) 
      race_track << ([player_name].concat( [" "] * (length - 1)))
    end
  end

  def set_player(player_name, name_and_position)
    instance_variable_set(player_name, name_and_position)
  end

  def get_player(player)
    instance_variable_get(player)
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    self.players_array.each_with_index do |player, index|
      return true if player.to_a.flatten.last >= self.length + 1
    end
    return false
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    winner = [0]

    self.players_array.each_with_index do |player, index|
      winner = player.flatten if player.flatten.last > winner.last
    end

    return winner.first
  end

  # Rolls the dice and advances +player+ accordingly
  def advance_players!(game)
    a_die = Die.new
    players_array.each { |player| player.each_key { |key| player[key] += a_die.roll}}
    update_board(game)
  end

  
  def update_board(game)
    race_track.map! { |track| [" "] * (length - 1)}
    players_array.each_with_index do |player, index|
      race_track[index][player.to_a.flatten.last] = player.to_a.flatten.first
    end
  end

  def display_board()

    race_track.each do |track|
     
      (0..length).each do |section|
        print " | #{track[section]}"
      end
      puts
    end
end

################
# CLEAN CANVAS #
################

  #Clears the content on the screen. Ah, a fresh canvas.
  #You don't have to test this
  def clear_screen!
    print "\e[2J"
  end

  #Moves the "cursor" back to the upper left.
  #You don't have to test this
  def move_to_home!
    print "\e[H"
  end

  #You don't have to test this
  def reset_screen!
    clear_screen!
    move_to_home!
  end
end