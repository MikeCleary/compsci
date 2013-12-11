require 'spec_helper'

describe Graph do

  before do
    @graph = Graph.new

    @sfo = @graph.add_vertex("San Francisco")
    @lax = @graph.add_vertex("Los Angeles")
    @san = @graph.add_vertex("San Diego")
    @phx = @graph.add_vertex("Phoenix")
    @den = @graph.add_vertex("Denver")
    @ord = @graph.add_vertex("Chicago")
    @iah = @graph.add_vertex("Houston")
    @jfk = @graph.add_vertex("New York")

    @graph.add_edge(@sfo, @lax, 381)
    @graph.add_edge(@sfo, @phx, 756)
    @graph.add_edge(@sfo, @ord, 2732)
    @graph.add_edge(@san, @lax, 393)
    @graph.add_edge(@san, @phx, 335)
    @graph.add_edge(@lax, @phx, 373)
    @graph.add_edge(@den, @san, 334)
    @graph.add_edge(@phx, @den, 862)
    @graph.add_edge(@phx, @iah, 1174)
    @graph.add_edge(@iah, @den, 1120)
    @graph.add_edge(@den, @ord, 1004)
    @graph.add_edge(@iah, @jfk, 1627)
    @graph.add_edge(@ord, @jfk, 790)
    @graph.add_edge(@den, @jfk, 1778)

    @graph.to_png

    # pending "Make these work..."
  end

  it "should know how many vertices there are" do
    @graph.vertices.length.should eq(8)
  end

  it "should know which cities are adjacent to each other" do
    @sfo.adjacent?(@lax).should be_true
    @sfo.adjacent?(@phx).should be_true
    @sfo.adjacent?(@jfk).should be_false
    @lax.adjacent?(@sfo).should be_true
    @phx.adjacent?(@sfo).should be_true
  end

  it "should calculate the shortest path between SF and LAX" do
    @graph.shortest_path(@sfo, @lax)
    @lax.distance.should eq(381)
  end

  it "should calculate the shortest path between SF and NYC" do
    @graph.shortest_path(@sfo, @jfk)
    @jfk.distance.should eq(2886)
  end

  it "should calculate the shortest path between SF and PHX" do
    @graph.shortest_path(@sfo, @phx)
    @phx.distance.should eq(754)
  end

  it "should calculate the shortest path between SF and Houston" do
    @graph.shortest_path(@sfo, @iah)
    @iah.distance.should eq(1928)
  end


end