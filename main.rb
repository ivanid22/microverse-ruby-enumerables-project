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
end

my_array = [1, 3, 5, 7]

puts('my_each:')
my_array.my_each do |element|
  puts element
end

puts("\nMy_each_with_index:")
my_array.my_each_with_index do |element, index|
  puts "Element at position #{index}: #{element}"
end
