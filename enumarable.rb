# frozen_string_literal: true

# Enumerable Module
module Enumerable
  # check if all elements in an enumeration
  # satisfy a certain criteria
  # if no proc is passed return true, else evaluate
  def my_all?(&prc)
    prc = proc { |obj| obj } unless block_given?
    result = true

    index = 0
    until result.equal?(false) || index.equal?(length)
      result &= prc.call(self[index]) && index += 1
    end
    result
  end

  # check if any element in an enumeration
  # satisfies a certain criteria/condition
  # if no proc is passes return false
  def my_any?(&prc)
    result = false
    return result unless block_given? || !empty?

    index = 0
    until result.equal?(true) || index.equal?(length)
      result |= prc.call(self[index]) && index += 1
    end
    result
  end

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

# manual tests - my_all?
result = array_of_strings.my_all? do |ele|
  ele.length > 3
end
puts "All\nAre all string are above 3 characters? #{result}"
result = [nil, 1, 34].my_all?
puts "[nil, 1, 34].my_all? should be false, got: #{result}\n\n"

return
# manual tests - my_any?
p "Any (without block)"
p "Any: [].any? should be false, got #{[].any?}"
p "Any: [].my_any? should be false got #{[].my_any?}"
puts "\n\n"

p "Any (with block)"
result = array_of_strings.any? { |s| s.length > 2 }
p "Any: [].any?(proc) should be true, got #{result}"
result = array_of_strings.my_any? { |s| s.length > 2 }
p "Any: [].my_any?(proc) should be false got #{result}"
puts "\n\n"

# manual tests - my_each
puts "calling my_each without a block:\n"
p array_of_strings.my_each
puts "\n\n"
