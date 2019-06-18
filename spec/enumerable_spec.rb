require_relative '../enumerable'

describe 'enumerable' do

    describe '.all?' do
        it 'should return true when all elements are truthy' do
            arr = ['i', 2, 3.4, true]
            val = arr.my_all? { |ele| ele }
            expect(val).to be_truthy
        end

        it 'should return false when some element is falsy' do
            arr = ['i', 2, 3.4, true, nil]
            val = arr.my_all? { |ele| ele }
            expect(val).not_to be_truthy
        end
    end

    it 'will run tomorrow morning'

    xit 'will be skipped too'

    it 'will not run'
end
