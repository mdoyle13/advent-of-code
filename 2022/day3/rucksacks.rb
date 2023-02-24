require 'set'

class Rucksack
  attr_reader :contents

  # contents is an array of 3 items
  def initialize(contents = [])
    @contents = contents
  end

  def prioritize_contents
    score(common_char(*split_contents))
  end

  private

  def split_contents
    contents.chars.each_slice(contents.size/2).map(&:to_set)
  end

  def common_char(left, right)
    (left & right).first
  end

  def score(char)
    ( ('a'..'z').to_a + ('A'..'Z').to_a).find_index(char) + 1
  end
end

score = 0
sacks = File.read('input1.txt').split("\n")
sacks.each do |contents|
  score += Rucksack.new(contents).prioritize_contents
end

puts score
