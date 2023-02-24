class Game
  WIN_CONDITIONS = {
    "rock": "scissors",
    "paper": "rock",
    "scissors": "paper"
  }

  PLAYER_1 = {
    "A": "rock",
    "B": "paper",
    "C": "scissors"
  }

  PLAYER_2 = {
    "X": "rock",
    "Y": "paper",
    "Z": "scissors"
  }

  SCORE_VALUES = {
    "rock": 1,
    "paper": 2,
    "scissors": 3
  }.freeze

  attr_reader :player_1_choice, :player_2_choice

  def initialize(choices)
    @player_1_choice = PLAYER_1[choices[0].to_sym]
    @player_2_choice = PLAYER_2[choices[1].to_sym]
  end

  def play
    if player_1_choice == player_2_choice
      calculate_score(player_2_choice, :draw)
    elsif WIN_CONDITIONS[player_2_choice.to_sym] == player_1_choice
      calculate_score(player_2_choice, :win)
    else
      calculate_score(player_2_choice, :loss)
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
    else
      throw Fudge
    end
  end
end

score = 0
rounds = File.read('input.txt').split("\n").collect{|a| a.split(" ")}
rounds.each do |round|
  score += Game.new(round).play
end

puts score