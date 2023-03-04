require 'pry'
# had to look up some help on this one as well
# https://github.com/cjavdev/advent-of-code/blob/main/2022/day07/day07.rb

input = File.read('input.txt')

dir_sizes = Hash.new { |h, k| h[k] = 0 }
current_path = []

# pattern matching
input.each_line do |line|
  case line.split
  in ["$", "cd", ".."]
    current_path.pop
  in ["$", "cd", dir]
    current_path << dir
  in ["$", "ls"]
  in ["dir", dirname]
  in [size, _filename]
    current_path.length.times do |i|
      # add the file size to each node in the path

      # select a key in the dir_sizes hash via an array like
      # dir_sizes[["/", "foo"]]="value"
      # can use += here because of how dir_sizes was initialized
      # default value of 0 for any key created
      dir_sizes[current_path[0..i]] += size.to_i
    end
  end
end

# using an array as hash key here!
# {["/"]=>48381165, ["/", "a"]=>94853, ["/", "a", "e"]=>584, ["/", "d"]=>24933642}

# part 1
# sum all directories > 100_000
# puts dir_sizes.select {|_k, v| v <= 100_000}.values.inject(:+)


total = 70000000
needed = 30000000
used = dir_sizes[['/']]
unused_diskspace = total - used

# unused is still less than the needed disksapce - we don't have enough space
# whats the minimum folder size we can delete to get to the needed amount?
target_size = needed - unused_diskspace

p dir_sizes.values.sort.detect { |size| size >= target_size }
