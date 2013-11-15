require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require './binary_tree'

include BinaryTree

describe "Binary Tree" do

  it "should do depth first traversal" do
    node  = create_simple_tree
    words = node.depth_first
    expect(words).to eq(['a', 'b', 'd', 'c'])
  end

  it "should do breadth first traversal" do
    node  = create_simple_tree
    words = node.breadth_first
    expect(words).to eq(['a', 'b', 'c', 'd'])
  end

  it "should do a complex bredth first traversal" do
    node = create_complex_tree
    words = node.breadth_first
    expect(words).to eq(['a', 'b', 'c', 'd', 'e', 'f', 'g'])
  end

  it "should do a complex depth first traversal" do
    node = create_complex_tree
    words = node.depth_first
    expect(words).to eq(['a', 'b', 'd', 'c', 'e', 'f', 'g'])
  end

  private

  def create_simple_tree
    node = Node.new("a")
    node.left  = Node.new("b")
    node.right = Node.new("c")
    node.left.left = Node.new("d")
    node
  end

  def create_complex_tree
    node = create_simple_tree
    node.right.right = Node.new("e")
    node.right.right.left  = Node.new("f")
    node.right.right.right = Node.new("g")
    node
  end

end
