# frozen_string_literal: true

# Enumerable Module
module Enumerable
  # my_all? (continue as above)
  def my_all?; end

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

# manual tests - my_each
p %w[edward was here on sunday].my_each
%w[edward was here on sunday].my_each do |ele|
  p ele * 1
end
