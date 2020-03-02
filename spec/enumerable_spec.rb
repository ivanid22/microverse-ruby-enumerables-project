
require './main'

RSpec.describe "Enumerable" do
  describe "#my_each" do
    let(:numeric_arr) {
      [1, 2, 3, 4, 5, 6]
    }

    it "should return enum if no block given" do
      expect(numeric_arr.my_each).to be_a(Enumerator)
    end

    it "should return the array itself when a block is passed" do
      expect(
        numeric_arr.my_each do |el|
        end
      ).to eql(arr) 
    end
  
    it "should not return nil when called on an empty Enumerable" do
      expect([].my_each).not_to eql(nil)
    end
  end
end