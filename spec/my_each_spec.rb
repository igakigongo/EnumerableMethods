# frozen_string_literal: true

require_relative '../enumerable'

describe Enumerable do
  describe '.each' do
    it 'returns an enumerator when no block is given' do
      enumerator = [1, 2, 3, 4, 5].my_each
      expect(enumerator).to be_an Enumerator
    end

    it 'yields an item per iteration when a block is given' do
      expect do |b|
        [1, 2, 3, 4].my_each(&b)
      end.to yield_successive_args(1, 2, 3, 4)
    end

    it 'yields when given a Range' do
      expect do |b|
        (1..4).my_each(&b)
      end.to yield_successive_args(1, 2, 3, 4)
    end
  end
end
