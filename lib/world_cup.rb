require './lib/player'
require './lib/team'

class WorldCup
  attr_accessor :year,
                :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    teams = @teams.select {|team| team.eliminated == false }
    players = []
    teams.each do |team|
      players << team.players_by_position(position)
    end
    players.flatten
  end

  def all_players(active="no")
    teams = @teams.select {|team| team.eliminated == false } if active == "yes"
    #require "pry"; binding.pry
    teams = @teams if active == "no"
    defenders =  []
    teams.each do |team|
      defenders << team.players_by_position(:defender)
    end
    defenders.flatten!


    defenders.map! {|player|  player.name}
    defenders.sort!

    forwards = []
    teams.each do |team|
      forwards << team.players_by_position(:forward)
    end
    forwards.flatten!
    forwards.map! {|player|  player.name}
    forwards.sort!

    midfielders = []
    teams.each do |team|
      midfielders << team.players_by_position(:midfielder)
    end
    midfielders.flatten!
    midfielders.map! {|player|  player.name}
    midfielders.sort!

    if defenders.empty?
      string = "Forwards\n\t" + "- " +
                forwards.join("\n\t- ") +
                "\n\nMidfielders\n\t" + "- " +
                midfielders.join("\n\t- ")
    elsif forwards.empty?
      string = "Defenders\n\t" + "- " +
                defenders.join(" \n\t- ") +
                "\n\nMidfielders\n\t" + "- " +
                midfielders.join("\n\t- ")
    elsif midfielders.empty?
      string = "Defenders\n\t" + "- " +
                defenders.join(" \n\t- ") +
                "\n\nForwards\n\t" + "- " +
                forwards.join("\n\t- ") 
    else
      string = "Defenders\n\t" + "- " +
                defenders.join(" \n\t- ") +
                "\n\nForwards\n\t" + "- " +
                forwards.join("\n\t- ") +
                "\n\nMidfielders\n\t" + "- " +
                midfielders.join("\n\t- ")
    end

    end
  end
