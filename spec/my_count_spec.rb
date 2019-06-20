# frozen_string_literal: true

require_relative '../enumerable'

# when .any? should return true
describe Enumerable do
  describe '.count? should return count of all elements' do
    it 'when no param and block are given' do
      expect([nil, true, 99].my_count).to eql 3
    end

    it 'equal to an argument when the argument is given' do
      expect([1, 2, 4, 2].my_count(2)).to eql 2
    end

    it 'yielding true when a block is given' do
      a = [1, 2, 4, 2]
      expect(a.my_count { |x| x%2 == 0 }).to eql 3
    end
  end
end
