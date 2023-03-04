require 'pry'

input = File.read('input.txt').split("\n")
trees = input.collect {|row_chars| row_chars.chars.map(&:to_i)}

def is_tree_visible?(trees, i, j)
 # we have the index of the row i and the index of the col j
 # i is row index, j is col index (index of the tree inside its array)
  height = trees[i][j]
  row = trees[i]
  col = trees.transpose[j]
  
  # all edges are visible
  return 1 if i == 0
  return 1 if j == 0
  return 1 if i == trees.length - 1
  return 1 if j == trees.first.length - 1
  
  # .. vs ... means include or exclude the end value
# (1..5).include?(5)           #=> true
# (1...5).include?(5)          #=> false

  # from the left is this tree the tallest?
  return 1 if height > row[0...j].max

  # from the right is this tree the tallest?
  return 1 if height > row[j+1..-1].max

  # i is the row index but cols have been transposed 
  # so to check the position of the tree in a column (up down)
  # we use col[i]

  # from the top is this tree the tallest?
  return 1 if height > col[0...i].max
  return 1 if height > col[i+1..-1].max

  # otherwise return 0
  0
end

def view_distance(rows, i, j)
  height = rows[i][j]
  row = rows[i]
  col = rows.transpose[j]

  score = 0
  scores = []

  (j-1).downto(0).each do |k|
    score += 1
    break if row[k] >= height
  end
  scores << score

  score = 0
  (j+1...row.size).each do |k|
    score += 1
    break if row[k] >= height
  end
  scores << score

  score = 0
  (i-1).downto(0).each do |k|
    score += 1
    break if col[k] >= height
  end
  scores << score

  score = 0
  (i+1...col.size).each do |k|
    score += 1
    break if col[k] >= height
  end

  scores << score
  scores.inject(:*)
end

def check_trees(trees)
  trees.length.times.map do |i|
    trees.first.length.times.map do |j|
      is_tree_visible?(trees, i, j)
    end
  end
end

def check_tree_views(trees)
  trees.length.times.map do |i|
    trees.first.length.times.map do |j|
      view_distance(trees, i, j)
    end
  end
end


#p check_trees(trees).flatten.sum
p check_tree_views(trees).flatten.max

