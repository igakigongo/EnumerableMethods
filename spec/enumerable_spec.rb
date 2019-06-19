require_relative '../enumerable'

describe 'enumerable' do

    describe '.all?' do
        describe 'should return true when all items' do
            it 'are truthy' do
                arr = ['i', 2, 3.4, true]
                val = arr.my_all? { |ele| ele }
                expect(val).to be_truthy
            end

            it 'match a pattern' do
                arr = ['i', 'am', 'a', 'string']
                val = arr.my_all?(String)
                expect(val).to be true
            end
        end
        
        describe 'should return false when some element' do
            it 'is falsy' do
                arr = ['i', 2, 3.4, true, nil]
                val = arr.my_all? { |ele| ele }
                expect(val).not_to be_truthy
            end
        end
    end
end
