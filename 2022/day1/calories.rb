elf_calorie_map = []

File.read('input.txt').split("\n\n")
  .collect(&:chomp)
  .collect{ |elf_cals| elf_cals.split("\n").collect(&:to_i).inject(:+) }
  .each_with_index do |cals, idx|
    elf_calorie_map << {elf_number: idx+1, calories: cals}
  end

  puts elf_calorie_map.sort_by {|elf| elf[:calories]}.reverse.first[:calories]