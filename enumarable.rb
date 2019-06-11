# frozen_string_literal: true

# Enumerable Module
module Enumerable
  # check if all elements in an enumeration
  # satisfy a certain criteria
  # if no proc is passed return true, else evaluate
  def my_all?(&prc)
    result = true
    return result unless block_given? || empty?

    index = 0
    until result.equal?(false) || index.equal?(length)
      result &= prc.call(self[index]) && index += 1
    end
    result
  end

  def my_any?; end

  def my_count; end

  # provides an enumeration over items,
  # if a block is given - it will be applied to each element
  # befor returning the enumeration
  def my_each(&prc)
    return to_enum(:my_each) unless block_given?

    index = 0
    prc.call(self[index]) && index += 1 until index.equal?(length)
    self
  end

  def my_each_with_index; end

  def my_inject; end

  def my_map; end

  def my_none?; end

  def my_select; end
end

array_of_strings = %w[edward iga was here on sunday]

# manual tests - my_all
result = array_of_strings.my_all? do |ele|
  ele.length > 3
end
puts "Are all string are above 3 characters? #{result}\n\n"

# manual tests - my_each
puts "calling my_each without a block:\n"
p array_of_strings.my_each
