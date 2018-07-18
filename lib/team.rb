require 'pry'
require './lib/player.rb'

class Team
  attr_reader :country,
              :players


  def initialize(country)
    @country = country
    @players = []
    @elimiation_status = false
  end

  #hmmmm i got stuck here,,, il come back later
  def eliminated?()
    @elimiation_status
  end

  def add_player(player)
    @players << player
  end


# I am sure there is an easier way to do this  hahahahahah
  def players_by_position(play_position)


    @players.map do |player|
      if player.position == play_position
        wanted_players = []
        wanted_players << player
        return wanted_players

      end
    end
  end
















end
