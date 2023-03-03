stacks_data, moves_data = File.read('input.txt').split("\n\n")

# i needed a little help with this part :(
# https://github.com/cjavdev/advent-of-code/blob/main/2022/day05/day05.rb
towers = []
stacks_data.split("\n")
  .map {|line| line.split(/\s{4}| /)}
  .reverse
  .map
  .with_index do |level, i|
    next if i == 0
    # remove brackets from each level
    level
      .map {|tower| tower.gsub(/\[|\]/, '')}
      .each_with_index do |el, i|
        next if el == ""
        towers[i] = [] if towers[i].nil?
        towers[i] << el
      end
  end

moves = []
moves_data.split("\n").each do |line|
  moves << line.scan(/\d+/).map(&:to_i)
end

moves.each do |move|
  n, from, to = move
  # pop n values off the "from" array and add them to the to array
  towers[to - 1] += towers[from - 1].pop(n)
end

puts towers.map(&:last).join