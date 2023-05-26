require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) {Dessert.new("cookie", 5, "Remy")}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cookie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq ([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {dessert.initialize("", "", "")}.to raise_error(ArgumentError)
    end
    end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to_not include("cilantro")
      dessert.add_ingredient("cilantro")
      expect(dessert.ingredients).to include("cilantro")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(dessert.mix).to call(ingredients.shuffle!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.eat.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ dessert.eat(7) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to eq(chef.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end