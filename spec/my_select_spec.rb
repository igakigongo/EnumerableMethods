# frozen_string_literal: true

require_relative '../enumerable'

# Returns an array containing all elements of enum
# for which the given block returns a true value.
# If no block is given, an Enumerator is returned instead.
describe Enumerable do
  context '.my_select should return' do
    it 'an enumerator when no block is given' do
      expect((1..10).my_select).to be_an Enumerable
    end

    context 'elements for which the given block returns a true' do
      it 'example 1' do
        a = (1..10).my_select { |i| i % 3 == 0 }
        expect(a).to match_array [3, 6, 9]
      end

      it 'example 2' do
        a = (1..5).my_select { |i| i.even? }
        expect(a).to match_array [2, 4]
      end

      it 'example 2' do
        a = [:foo, :bar].my_select { |x| x == :foo }
        expect(a).to include(:foo)
      end
    end
  end
end
