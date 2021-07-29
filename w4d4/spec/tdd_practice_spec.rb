require "tdd_practice.rb"

describe Array do
    
    
    describe "#my_uniq" do 
        let(:arr1) {[1, 2, 1, 1, 3]}
        let(:arr2) {[1, 1, 1]}

        it "should return unique values in the array" do
            expect(arr1.my_uniq).to eq([1, 2, 3])
            expect(arr2.my_uniq).to eq([1])
        end 
    end 

    describe "#my_uniq" do 
        let(:arr1) {[1, 2, 1, 1, 3]}
        let(:arr2) {[-1, 0, 2, -2, 1]}

        it "should return unique values in the array" do
            expect(arr1.two_sum).to eq([])
            expect(arr2.two_sum).to eq([[0, 4], [2, 3]])
        end 
    end 



end 