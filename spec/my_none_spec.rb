# frozen_string_literal: true

require_relative '../enumerable'

# when .my_none? should return true
# [1, 3.14, 42].none?(Float)                         #=> false
describe Enumerable do
  context '.none? should return true when no item' do
    it 'exists in enumerable' do
      expect([].my_none?).to be true
    end

    it 'in block yields true' do
      a = %w[ant bear cat]
      expect(a.my_none? { |word| word.length >= 5 }).to be true
    end

    it 'matches a pattern' do
      expect(%w[ant bear cat].my_none?(/d/)).to be true
    end

    it 'is truthy - example 1' do
      expect([nil].my_none?).to be true
    end

    it 'is truthy - example 2' do
      expect([nil, false].my_none?).to be true
    end
  end
end

# when .any? should return false
describe Enumerable do
  describe '.none? should return false when some item' do
    it 'in block yields true' do
      expect(%w[ant bear cat].my_none? { |word| word.length >= 4 }).to be false
    end

    it 'is truthy' do
      expect([nil, false, true].my_none?).to be false
    end

    it 'matches a pattern' do
      expect([1, 3.14, 42].my_none?(Float)).to be false
    end
  end
end
