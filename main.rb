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

  def my_count(arg = nil)
    count_val = 0
    my_each do |element|
      count_val += 1 if (block_given? && yield(element)) || (element == arg)
    end
    count_val
  end

  def my_inject(*args)
    memo = args[0].is_a?(Symbol) ? self[0] : args[0] || self[0]
    symbol = identify_symbol(*args)
    pos = settle_start_position(*args)
    while pos < length
      memo = block_given? ? yield(memo, self[pos]) : memo.send(symbol, self[pos])
      pos += 1
    end
    memo
  end
end

def settle_start_position(*args)
  start_pos = 1
  start_pos = 0 if args[0] && !args[0].is_a?(Symbol)
  start_pos
end

def identify_symbol(*args)
  sym = nil
  if args.count == 2
    sym = args[1]
  elsif args.count == 1
    sym = args[0] if args[0].is_a?(Symbol)
  end
  sym
end

def multiply_els(arr)
  arr.my_inject(:*)
end

my_integer_array = [20, 1, 1, 2, 3, 4, 5, 6, 7]
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
puts my_integer_array.my_select(&:even?)

puts("\nmy_all (checking if all of the array elements are numbers): ")
puts(
  my_mixed_array.my_all do |element|
    element.is_a? Integer
  end
)

puts("\nmy_any (checking if any of the array elements are strings): ")
puts(
  my_mixed_array.my_any do |element|
    element.is_a? String
  end
)

puts("\nmy_none (checking if none of the elements are strings): ")
puts(
  my_integer_array.my_none do |element|
    element.is_a? String
  end
)

puts("\nmy_count (with an argument == 1)")
puts(
  my_integer_array.my_count(1)
)

puts("\nmy_count (with a block passed)")
puts(
  my_integer_array.my_count do |element|
    element.is_a? Integer
  end
)

puts("\nmy_inject (calling multiply_els)")
puts multiply_els([2, 5, 7])