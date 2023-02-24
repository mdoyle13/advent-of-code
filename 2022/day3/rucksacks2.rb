require 'set'

class RucksackGroup
  attr_reader :rucksacks

  # contents is an array of 3 items
  def initialize(rucksacks)
    @rucksacks = rucksacks
  end

  def prioritize_contents
    score(common_char(*rucksacks.map {|s| s.chars.to_set }))
  end

  private

  def common_char(rucksack1, rucksack1, rucksack1)
    (rucksack1 & rucksack1 & rucksack1).first
  end

  def score(char)
    ( ('a'..'z').to_a + ('A'..'Z').to_a).find_index(char) + 1
  end
end

score = 0
sacks = File.read('input1.txt').split("\n")
sacks.each_slice(3) do |contents|
  score += RucksackGroup.new(contents).prioritize_contents
end

puts score
