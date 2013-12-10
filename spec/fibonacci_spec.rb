require 'spec_helper'

describe Fibonacci do

  before do
    before = Time.now
    @numbers = Fibonacci.seq(0, 40)
    @recursive = Time.now - before
  end

  it "should generate the Fibonacci sequence" do
    @numbers.should eq([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
  end

  describe "the iterative approach" do
    before do
      before = Time.now
      @numbers = Fibonacci.iterative_seq(0, 40)
      @iterative = Time.now - before
    end

    it "should generate the Fibonacci sequence" do
      @numbers.should eq([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
    end

    it "should run faster than a recursive algorithm" do
      (@iterative < @recursive).should be_true
      puts @recursive
      puts @iterative
    end

  end

end