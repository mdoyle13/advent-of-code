elf_calorie_map = []

File.read('input.txt').split("\n\n")
  .collect(&:chomp)
  .collect{ |elf_cals| elf_cals.split("\n").collect(&:to_i).inject(:+) }
  .each_with_index do |cals, idx|
    elf_calorie_map << {elf_number: idx+1, calories: cals}
  end

top_3_elves = elf_calorie_map.sort_by {|elf| elf[:calories]}.reverse.take(3)
top_3_elves_total = top_3_elves.inject(0) do |memo, elf|
  memo += elf[:calories]
end

puts top_3_elves_total