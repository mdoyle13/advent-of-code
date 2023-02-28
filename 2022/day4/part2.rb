require 'set'

# find paris that overlap at all

pairs = File.read('input.txt').split("\n")
overlapping_pairs = 0

# iterate over each pair
pairs.each do |pair|
  # split each pair string into an array with two positions
  # turn each position into a range
  left, right = pair.split(',').map do |string_range|
    start, stop = string_range.split("-")
    # convert range to an array, and then to a set
    Set.new (start.to_i..stop.to_i).to_a
  end

  # check if the two sets overlap using intersection
  if !(left & right).empty?
    overlapping_pairs += 1
  end
end

puts overlapping_pairs