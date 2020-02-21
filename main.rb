# rubocop:disable Style/CaseEquality

module Enumerable
  def my_each
    pos = 0
    loop do
      break if pos >= length

      yield self[pos]
      pos += 1
    end
  end
end

my_array = [1, 3, 5, 7]

my_array.my_each do |element|
  puts element
end
