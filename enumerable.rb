# frozen_string_literal: true

# Enumerable Module
module Enumerable
  # check if all elements in an enumeration
  # satisfy a certain criteria
  def my_all?(pattern = nil)
    result = true
    if block_given?
      my_each { |ele| result &= (yield ele) }
    elsif pattern
      my_each { |ele| result &= pattern === ele }
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
      my_each { |ele| return true if pattern === ele }
    else
      my_each { |ele| return true if ele }
    end
    false
  end

  # count elements matching a condition
  def my_count(param = nil)
    total = 0
    if block_given?
      my_each { |ele| total += 1 if yield ele }
    else
      return length if param.nil?

      my_each { |ele| total += 1 if ele == param }
    end
    total
  end

  # provides an enumeration over items,
  # if a block is given - it will be applied to each element
  # before returning the enumeration
  def my_each
    return to_enum :my_each unless block_given?

    tmp = is_a?(Range) ? to_a : self
    i = 0
    until i.equal? tmp.length
      yield tmp[i]
      i += 1
    end
    self
  end

  # use each - but spill ele, index on each iteration
  def my_each_with_index
    return to_enum :my_each_with_index unless block_given?

    i = 0
    my_each do |ele|
      yield ele, i
      i += 1
    end
    self
  end

  # reduce/inject method
  def my_inject(acc:, cur:)
    tmp = is_a?(Range) ? to_a : self
    a = acc.nil? || acc.is_a?(Symbol) ? tmp[0] : acc
    if block_given?
      start = acc ? 0 : 1
      tmp[start..-1].my_each { |e| a = yield(a, e) }
    end
    tmp[1..-1].my_each { |e| a = a.send(acc, e) } if acc.is_a?(Symbol)
    tmp[0..-1].my_each { |e| a = a.send(cur, e) } if cur
    a
  end

  # map elements using a block
  # return enumerable(self) if no block given
  def my_map
    return to_enum :my_map unless block_given?

    out = []
    my_each { |ele| out << (yield ele) }
    out
  end

  # check if none of
  # implicitly pass a_block if it should be passed into inner functions
  def my_none?(pattern = nil, &a_block)
    !my_any?(pattern, &a_block)
  end

  # select elements - check over block
  def my_select
    return to_enum :my_select unless block_given?

    out = []
    my_each { |ele| out << ele if yield ele }
    out
  end
end
