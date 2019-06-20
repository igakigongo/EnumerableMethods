# frozen_string_literal: true

require_relative '../enumerable'

# when .any? should return true
describe Enumerable do
  describe '.any? should return true when any item' do
    it 'is truthy' do
      expect([nil, true, 99].my_any?).to be true
    end

    it 'in block yields true' do
      a = %w[ant bear cat]
      expect(a.my_any? { |word| word.length >= 3 }).to be true
    end

    it 'matches a pattern' do
      a = [nil, true, 99]
      expect(a.my_any?(Integer)).to be true
    end
  end
end

# when .any? should return false
describe Enumerable do
  describe '.any? should return false when no item' do
    it 'is truthy' do
      expect([nil, false, nil].my_any?).to be false
    end

    it 'in block yields true' do
      expect(%w[ant bear cat].my_any? { |word| word.length >= 5 }).to be false
    end

    it 'exists in enumerable' do
      expect([].my_any?).to be false
    end

    it 'matches a pattern' do
      expect(%w[ant bear cat].my_any?(/d/)).to be false
    end
  end
end
