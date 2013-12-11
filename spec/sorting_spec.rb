require 'spec_helper'

describe "Sorting Algorithms" do
  before do
    @sorted = (0..10).to_a
    @jumbled = @sorted.shuffle
  end

  describe "Insertion Sort" do
    it "should sort it" do
      # pending "Need to implement insertion_sort"
      expect(@jumbled.insertion_sort).to eq(@sorted)
    end
  end

  describe "Quick Sort" do
    it "should sort it" do
      # pending "Need to implement quick_sort"
      expect(@jumbled.quick_sort).to eq(@sorted)
    end
  end

end