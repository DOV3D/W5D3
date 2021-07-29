require "tdd_practice.rb"

describe Array do

    describe "#uniq" do
        it "should return an array with uniq values" do
            expect([1,1,1,1].uniq).to eq([1])
            expect([1,2,3,1].uniq).to eq([1,2,3])
            expect([1,2,3,4].uniq).to eq([1,2,3,4])
            expect([].uniq).to eq([])
        end
    end

    describe "#two_sum" do
        it "finds the indices of values which sum to 0" do
            expect([1,1,1,1].two_sum).to eq([])
            expect([1,2,3,1].two_sum).to eq([])
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4], [2,3]])
            expect([].two_sum).to eq([])
        end
    end

    describe "#my_transpose" do
        let(:rows) {[
          [0, 1, 2],
          [3, 4, 5],
          [6, 7, 8]
        ]}
        let(:cols) {[
          [0, 3, 6],
          [1, 4, 7],
          [2, 5, 8]
        ]}
        let(:rows_t) {[
          [0, 3, 6],
          [1, 4, 7],
          [2, 5, 8]
        ]}
        let(:cols_t) {[
          [0, 1, 2],
          [3, 4, 5],
          [6, 7, 8]
        ]}

        it "rotates an n x m 2D array" do
            expect(rows.my_transpose).to eq(rows_t)
            expect(cols.my_transpose).to eq(cols_t)
        end
    end
end


describe "#profit" do
    it "most profitable day to buy and sell stock" do
        expect(profit([100, 180, 260, 310, 40, 535, 695])).to eq([4, 6])
        expect(profit([100, 180, 260, 310, 695, 535, 40])).to eq([0, 4])
        expect(profit([100, 180, 50, 55, 1000, 535, 40])).to eq([2, 4])
        expect(profit([60, 180, 50, 1000, 40, 535, 500])).to eq([2, 4])
    end
end