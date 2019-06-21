# frozen_string_literal: true

require_relative '../enumerable'

describe Enumerable do
  describe '.inject' do
    it 'should return an enumerator when no block is given' do
      expect((5..10).my_map).to be_an Enumerator
    end

    it 'should return an array when a block is given' do
      expect((1..4).my_map { |i| i**2 }).to be_an Array
    end

    it 'should return same length of items' do
      len = (1..4).my_map { |i| i**2 }.length
      expect(len).to eql 4
    end

    it 'should not mutate state - check by identity' do
      array = (1..4).to_a
      mapped = array.my_map { |i| i**2 }
      expect(array.object_id).not_to eql mapped.object_id
    end

    it 'should not mutate state - check by values' do
      array = (1..4).to_a
      array.my_map { |i| i**2 }
      expect(array).to match_array [1, 2, 3, 4]
    end
  end
end
