# frozen_string_literal: true

# Enumerable Module
module Enumerable
  # check if all elements in an enumeration
  # satisfy a certain criteria
  def my_all?(pattern = nil)
    result = true
    if block_given?
      my_each { |ele| result &= yield ele }
    elsif pattern
      my_each { |ele| result &= ele.equal?(pattern) }
    else
      my_each { |ele| result &= ele }
    end
    result
  end

  # check if any element in an enumeration
  # satisfies a certain criteria/condition
  # if no proc is passed use truthy/falsy values
  def my_any?(pattern = nil)
    if block_given?
      my_each { |ele| return true if yield ele }
    elsif pattern
      my_each { |ele| return true if ele.equal?(pattern) }
    else
      my_each { |ele| return true if ele }
    end
    false
  end

  def my_count; end

  # provides an enumeration over items,
  # if a block is given - it will be applied to each element
  # before returning the enumeration
  def my_each
    return to_enum :my_each unless block_given?

    tmp = is_a?(Range) ? to_a : self
    i = 0
    yield tmp[i] && i += 1 until i.equal?(tmp.length)
    self
  end

  def my_each_with_index; end

  def my_inject; end

  def my_map; end

  # check if none of
  # implicitly pass a_block if it should be passed into inner functions
  def my_none?(pattern = nil, &a_block)
    !my_any?(pattern, &a_block)
  end

  def my_select; end
end

p (1..10).my_none? { |x| x.negative? }
p (1..10).all? { |k| k.positive? }
p (1..10).my_all? { |k| k.positive? }
