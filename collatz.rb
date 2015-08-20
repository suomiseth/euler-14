class Collatz
  @@path_count_hash = Hash.new

  def initialize(num)
    @num = num
  end

  def sequence_array
    number = @num
    temp_arr = []
    while number != 1 && !(@@path_count_hash.has_key?(number))
      temp_arr << number
      if number % 2 == 0
        number = number / 2
      else
        number = number * 3 + 1
      end
    end

    if number == 1
      @@path_count_hash[@num] = temp_arr.size + 1
    else
      @@path_count_hash[@num] = temp_arr.size + @@path_count_hash[number]
    end
  end

  def self.find_longest(limit)
    (1..limit).each {|n| Collatz.new(n).sequence_array}
    @@path_count_hash.max_by {|k,v| v}[0]
  end
end

puts "what is the limit you want to do collatz to?"
limit = gets.strip.to_i
puts "the longest is number: #{Collatz.find_longest(limit)}."


### right answer = 837799