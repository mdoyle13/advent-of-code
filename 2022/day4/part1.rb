# find pairs that contain full ranges

pairs = File.read('input.txt').split("\n")
overlapping_pairs = 0

# iterate over each pair
pairs.each do |pair|
  # split each pair string into an array with two positions
  # turn each position into a range
  left, right = pair.split(',').map do |string_range|
    start, stop = string_range.split("-")
    (start.to_i..stop.to_i)
  end

  if left.cover?(right) || right.cover?(left)
    overlapping_pairs += 1
  end
end

puts overlapping_pairs