require 'spec_helper'

describe BinaryTree do

  before do
    @tree = BinaryTree.new

    %w(Dan Barry Tina Daniel Alice Andy Sally).each do |name|
      @tree.insert_data(name)
    end
  end

  describe "Insertion" do
    it "should insert nodes in alphabetical order" do
      @tree.root.data.should eq("Dan")
      @tree.root.left.data.should eq("Barry")
      @tree.root.right.data.should eq("Tina")
      @tree.root.right.left.data.should eq("Daniel")
      @tree.root.left.left.data.should eq("Alice")
      @tree.root.left.left.right.data.should eq("Andy")
      @tree.root.right.left.right.data.should eq("Sally")
    end
  end

  describe "Searching" do
    before do

    end

    context "nodes" do
      before do
        @nodes = @tree.nodes
      end

      it "should find all the nodes" do
        @nodes.map do |node|
          puts node.data
        end
        @nodes.length.should eq(7)
      end

      it "should find the nodes in order" do
        @nodes[0].data.should eq("Alice")
        @nodes[1].data.should eq("Andy")
        @nodes[2].data.should eq("Barry")
        @nodes[3].data.should eq("Dan")
        @nodes[4].data.should eq("Daniel")
        @nodes[5].data.should eq("Sally")
        @nodes[6].data.should eq("Tina")
      end
    end

    context "leaf nodes" do
      before do
        @leaf_nodes = @tree.leaf_nodes
      end

      it "should count the number of leaf nodes" do
        @leaf_nodes.length.should eq(2)
      end

      it "should find leaf nodes in order" do
        @leaf_nodes[0].data.should eq("Andy")
        @leaf_nodes[1].data.should eq("Sally")
      end
    end

    context "find and include?" do
      it "should know if a Node is present or not" do
        @tree.include?('Sally').should be_true
        @tree.include?('Simon').should be_false
      end

      it "should return the node with a given name" do
        @tina = @tree.find("Tina")
        @tina.should_not be_nil
        @tina.left.data.should eq("Daniel")
        @tina.left.right.data.should eq("Sally")
      end
    end

    context "search method" do
      it "should return nodes having data of length greater than 3" do
        @tree.search do |node|
          node.data.length > 3
        end.should eq(["Alice", "Andy", "Barry", "Daniel", "Sally", "Tina"].map {|n| Node.new(n)})
      end

      it "should return nodes having exactly two children" do
        @tree.search do |node|
          node.left && node.right
        end.should eq([Node.new("Dan")])
      end

      it "should return nodes ending in y" do
        @tree.search do |node|
          node.data =~ /y$/
        end.should eq([Node.new("Andy"), Node.new("Barry"), Node.new("Sally")])
      end
    end
  end

  describe "Deletion" do
    before do
      pending "TODO add a delete function..."
      @tree.delete("Tina")
    end

    it "should remove a node" do
      @tree.include?('Tina').should be_false
    end

    it "should replace the node with its left child" do
      @tree.root.right.data.should eq("Daniel")
      @tree.root.right.right.data.should eq("Sally")
    end
  end

end