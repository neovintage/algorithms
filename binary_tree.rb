module BinaryTree

  class Node
    attr_accessor :left, :right, :count, :word

    def initialize(word)
      @word  = word
      @count = 1
    end

    def size
      total = 1
      total += left.size  if !left.nil?
      total += right.size if !right.nil?
      total
    end

    # Depth-first traversal
    #
    def depth_first
      words = [word]
      words += left.depth_first  if !left.nil?
      words += right.depth_first if !right.nil?
      words
    end

    # Breath-first traversal
    #
    def breadth_first
      queue = [self]
      words = []
      while(!queue.empty?) do
        node  =  queue.shift
        words << node.word
        [:left, :right].each do |side|
          queue.push(node.send(side)) if !node.send(side).nil?
        end
      end
      words
    end
  end

end
