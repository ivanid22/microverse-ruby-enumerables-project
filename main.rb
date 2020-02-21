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

  def my_all
    return_val = true
    my_each do |element|
      return_val = yield element
    end
    return_val
  end

  def my_any
    return_val = false
    my_each do |element|
      return_val = yield element
    end
    return_val
  end

  def my_none
    return_val = true
    my_each do |element|
      return_val = !(yield element)
    end
    return_val
  end
end

my_integer_array = [1, 2, 3, 4, 5, 6, 7]
my_mixed_array = [1, 2, 3, 'a', 'b', 'c']

puts("\nmy_each:")
my_integer_array.my_each do |element|
  puts element
end

puts("\nmy_each_with_index:")
my_integer_array.my_each_with_index do |element, index|
  puts "Element at position #{index}: #{element}"
end

puts("\nmy_select (selecting even numbers):")
evens = my_integer_array.my_select(&:even?)
puts evens

puts("\nmy_all (checking if all of the array elements are numbers): ")
result_all_ints = my_mixed_array.my_all do |element|
  element.is_a? Integer
end
puts result_all_ints

puts("\nmy_any (checking if any of the array elements are strings): ")
result_all_strings = my_mixed_array.my_any do |element|
  element.is_a? String
end
puts result_all_strings

puts("\nmy_none (checking if none of the elements are strings): ")
result_no_strings = my_integer_array.my_none do |element|
  element.is_a? String
end
puts result_no_strings
