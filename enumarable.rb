# frozen_string_literal: true

# Enumerable Module
module Enumerable
  # check if all elements in an enumeration
  # satisfy a certain criteria
  # if no proc is passed return true, else evaluate
  def my_all?(&prc)
    prc = proc { |obj| obj } unless block_given?
    p prc.class
    result = true

    index = 0
    until result.equal?(false) || index.equal?(length)
      result &= prc.call(self[index]) && index += 1
    end
    result
  end

  # check if elements match patterns
  def my_all?(pattern)
    result = true
    is_regexp = pattern.is_a?(Regexp)
    index = 0
    until result.equal?(false) || index.equal?(length)
      result &= is_regexp ? pattern.match?(self[index]) : self[index].is_a?(pattern)
      index += 1
    end
    result
  end

  # check if any element in an enumeration
  # satisfies a certain criteria/condition
  # if no proc is passed return false
  def my_any?(&prc)
    p prc.class
    prc = proc { |obj| obj } unless block_given?
    result = true

    index = 0
    #until result.equal?(true) || index.equal?(length)
    until index.equal?(length)
      v = prc.call(self[index])
      p "#{self[index]} => #{v}"
      result |= v
      index += 1
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

# manual tests - my_all?
puts "Any\n"
p %w[ant bear cat].all? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
p %w[ant bear cat].my_all?(/t/)                     #=> false
p [1, 2i, 3.14].all?(Numeric)                       #=> true
p [nil, true, 99].all?                              #=> false
p [].all?                                           #=> true
return
puts "\n\nAll\n"
p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].any? { |word| word.length >= 4 } #=> true
p %w[ant bear cat].my_any? { |k| /d/.match?(k) }                        #=> false
p [nil, true, 99].any?(Integer)                     #=> true
p [nil, true, 99].any?                              #=> true
p [].any?                                           #=> false
