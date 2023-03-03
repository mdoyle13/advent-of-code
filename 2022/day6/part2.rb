input = File.read('input.txt')

marker_check = []

# unshift edits the array inplace
input.chars.each do |char|
  # push the character onto an array
  marker_check.push(char)
  next if marker_check.length < 14
  
  marker_check.delete_at(0) unless marker_check.length == 14

  if marker_check.uniq.length == marker_check.length
    break
  else
    next
  end
end

puts input.index(marker_check.join) + 14
