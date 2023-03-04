require 'pry'

input = File.read('input.txt').split("\n")
trees = input.collect {|row_chars| row_chars.chars.map(&:to_i)}

def is_tree_visible?(trees, i, j)
 # we have the index of the row i and the index of the col j
  height = trees[i][j]
  row = trees[i]
  col = trees.transpose[j]
  puts i.inspect
  puts j.inspect
  
  # all edges are visible
  return 1 if i == 0
  return 1 if j == 0
  return 1 if i == trees.length - 1
  return 1 if j == trees.first.length - 1
  
  # .. vs ... means include 
# (1..5).include?(5)           #=> true
# (1...5).include?(5)          #=> false

  # from the left is this tree the tallest?
  return 1 if height > row[0...j].max

  # from the right is this tree the tallest?
  return 1 if height > row[j+1..-1].max

  # from the top is this tree the tallest?
  return 1 if height > col[0...i].max
  return 1 if height > col[i+1..-1].max

  # otherwise return 0
  0
end

def scenic_score(trees, i, j)
  height = trees[i][j]
  row = trees[i]
  col = trees.transpose[j]
  scores = []
  
  (j - 1 )

end

def check_trees(trees)
  trees.length.times.map do |i|
    trees.first.length.times.map do |j|
      is_tree_visible?(trees, i, j)
    end
  end
end


p check_trees(trees).flatten.sum

