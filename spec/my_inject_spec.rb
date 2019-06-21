# frozen_string_literal: true

require_relative '../enumerable'

describe Enumerable do
  describe '.inject' do
    it 'should add correctly when :+ symbol is used' do
      expect((5..10).my_inject(:+)).to eql 45
    end

    it 'should add correctly when a block is used' do
      expect((5..10).my_inject { |a, c| a + c }).to eql 45
    end

    it 'should multiply correctly when :* symbol is used' do
      expect((5..10).my_inject(:*)).to eql 151_200
    end

    it 'should multiply correctly when a block is used' do
      expect((5..10).my_inject { |a, c| a * c }).to eql 151_200
    end

    it 'should evaluate a binary operation correctly when given a block' do
      longest = %w[cat sheep bear].inject do |memo, word|
        memo.length > word.length ? memo : word
      end
      expect(longest).to match(/sheep/)
    end
  end
end
