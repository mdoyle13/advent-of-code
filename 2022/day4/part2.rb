require 'set'

# find paris that overlap at all

pairs = File.read('input.txt').split("\n")
overlapping_pairs = 0

# iterate over each pair
pairs.each do |pair|
  # split each pair string into an array with two positions
  # turn each position into a range
  # return a new Set from the range
  left, right = pair.split(',').map do |string_range|
    start, stop = string_range.split("-")
    (start.to_i..stop.to_i).to_set
  end

  # check if the two sets overlap using intersection
  # only increase the counter if the intersection (which returns a new Set) is not empty
  if !(left & right).empty?
    overlapping_pairs += 1
  end
end

puts overlapping_pairs