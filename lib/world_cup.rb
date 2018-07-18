require "pry"
require "./lib/team"

class WorldCup
  attr_reader :year, :teams
  def initialize(year, array_of_teams)
    @year = year
    @teams = array_of_teams
  end

  def active_teams
    @teams.select do |team|
      team.eliminated == false
    end
  end

  def active_players_by_position(position_on_field)
    return_array = []
    active_teams.select do |team|
      team.players.select do |player|
        if player.position == position_on_field
          return_array << player
        end
      end
    end
    return_array
  end

  def all_players(in_or_out = false)
    if in_or_out == false
      player_positions = Player.positions
    else
      screendoor = []
      active_teams.map do |team|
        team.positions.map do |position|
          if screendoor.include?(position)
            position
          else
            screendoor << position
          end
        end
      end
      player_positions = screendoor
    end

    players_array = player_positions.map do |position|
      active_players_by_position(position)
    end

    player_names = players_array.map do |player_array|
      player_array.map do |player|
        player.name
      end
    end

    alphabetical_player_names = player_names.map do |players|
      players.sort
    end

    x = 0
    the_string = []

    while x < player_positions.count
      the_string << "#{player_positions[x].capitalize}s"
      y = 0
      while y < alphabetical_player_names[x].count
        the_string << "\n\t- #{alphabetical_player_names[x][y]}"
        y += 1
      end
      x += 1
      the_string << "\n\n"
    end
    the_string.join
  end

end
