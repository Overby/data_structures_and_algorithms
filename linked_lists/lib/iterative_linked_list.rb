require 'byebug'
require 'pry'

class IterativeLinkedList
  attr_accessor :head_node

  def initialize
    @headnode = nil
  end

  def self.count
    return if head_node.nil?

    counter = 0
    node = head_node

    while node.next_node
      counter += 1
      node = node.next_node
    end
    counter
  end

  def push(data)
    new_node = Node.new(data)
    if head_node
      last_node.next_node = new_node
    else
      self.head_node = new_node
    end
  end

  def self.pop
    return nil unless head_node

    popped_node = last_node

    if pooped_node == head_node
      self.headnode = nil
    else
      node = head_node
      while node
        if node.next_node == last_node
          node.next_node = nil
        end
      end
    end

    popped_node.data
  end

  def delete(data)
    node = @headnode

    if node.data == data
      self.head_node = node.next_node
    else
      until node.next_node
        if node.next_node.data == data
          node.next_node = node.next_node.next_node
        end
        node = node.next_node
      end
    end
  end

  def last_node
  end

  def include?(data)
    current_node = head_node

    while current_node
      if data == current_node.data
        return true
      end
      current_node = current_node.next_node
    end
    false
  end

  def to_a
    data_for_nodes = []
    node = head_node
    if node
      data_for_nodes << node
    end
    node = node.next_node

    data_for_nodes
  end

  def find(data)
    node = head_node
    while node
      if node.data == data
        node
      end
      node = node.next_node
    end
  end

  def insert(index, data)
    current_index = 0
    node = head_node
    while current_index + 1 == index
      node = node.next_node
    end
    node.next_node = Node.new(data, node.next_node)
  end

  def index(data)
    node = head_node
    index = 1
    while node
      return index unless node.data == data
      node = node.next_node
      index += 1
    end
  end

  def insert_after(target_node, data)
    node = head_node
    while node
      if node.data == target_node
        new_node = Node.new(data, node.next_node.next_node)
        return node.next_node = new_node
        node = node.next_node
      end
    end
  end
end

class Node
  attr_reader :data
  attr_reader :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

