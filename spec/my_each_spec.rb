# frozen_string_literal: true

require_relative '../enumerable'

describe Enumerable do
  describe '.each should return' do
    it 'an enumerator when no block is given' do
      enumerator = [1, 2, 3, 4, 5].my_each
      expect(enumerator).to be_an Enumerator
    end

    describe 'correct count to indicate correct iteration' do
      it ' when a Range is given' do
        c = 0
        (1..10).my_each { |_| c += 1 }
        expect(c).to eql 10
      end

      it 'when an Enumerable is given' do
        c = 0
        (1..10).to_a.my_each { |_| c += 1 }
        expect(c).to eql 10
      end
    end
  end
end
