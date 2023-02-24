require 'pry'

class Game
  WIN_CONDITIONS = {
    "rock": "scissors",
    "paper": "rock",
    "scissors": "paper"
  }.freeze

  LOSE_CONDITIONS = {
    "scissors": "paper",
    "rock": "scissors",
    "paper": "rock"
  }

  PLAYER_1 = {
    "A": "rock",
    "B": "paper",
    "C": "scissors"
  }.freeze

  PLAYER_2 = {
    "X": "rock", # lose
    "Y": "paper", # draw
    "Z": "scissors" # win
  }.freeze

  SCORE_VALUES = {
    "rock": 1,
    "paper": 2,
    "scissors": 3
  }.freeze

  attr_reader :player_1_choice, :player_2_choice

  def initialize(choices)
    # get strings from symbol keys
    @player_1_choice = PLAYER_1[choices[0].to_sym]
    @player_2_choice = choice_for_desired_outcome(player_1_choice, choices[1])
  end

  # compare strings
  def play
    if player_1_choice == player_2_choice
      calculate_score(player_2_choice, :draw)
    elsif WIN_CONDITIONS[player_2_choice.to_sym] === player_1_choice
      calculate_score(player_2_choice, :win)
    else
      calculate_score(player_2_choice, :loss)
    end
  end

  # return a string
  def choice_for_desired_outcome(player_1_choice, outcome_delimieter)
    case outcome_delimieter
    when "X"
      LOSE_CONDITIONS[player_1_choice.to_sym]
    when "Y"
      player_1_choice
    when "Z"
      WIN_CONDITIONS.dup.invert[player_1_choice].to_s
    end
  end

  def calculate_score(player_2_choice, outcome)
    choice_score = SCORE_VALUES[player_2_choice.to_sym]
    case outcome
    when :loss
      0 + choice_score
    when :draw
      3 + choice_score
    when :win
      6 + choice_score
    end
  end
end

score = 0
rounds = File.read('input.txt').split("\n").collect{|a| a.split(" ")}
rounds.each do |round|
  score += Game.new(round).play
end

puts score