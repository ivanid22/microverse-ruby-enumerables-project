module Enumerable
  def my_each
    pos = 0
    loop do
      break if pos >= length

      yield self[pos]
      pos += 1
    end
  end

  def my_each_with_index
    pos = 0
    loop do
      break if pos >= length

      yield self[pos], pos
      pos += 1
    end
  end

  def my_select
    return_arr = []
    my_each do |element|
      return_arr.push(element) if yield element
    end
    return_arr
  end
end

my_array = [1, 2, 3, 4, 5, 6, 7]

puts("\nmy_each:")
my_array.my_each do |element|
  puts element
end

puts("\nmy_each_with_index:")
my_array.my_each_with_index do |element, index|
  puts "Element at position #{index}: #{element}"
end

puts("\nmy_select (selecting even numbers):")
evens = my_array.my_select(&:even?)
puts evens
