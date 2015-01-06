require 'byebug'
require 'pry'

class IterativeLinkedList
  attr_accessor :head_node

  def initialize
    @head_node = nil
  end

  def count
    return 0 if head_node.nil?

    counter = 1
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

  def pop
    return nil unless head_node

    popped_node = last_node

    if popped_node == head_node
      self.head_node = nil
    else
      node = head_node
      while node
        if node.next_node == last_node
          node.next_node = nil
        end
        node = node.next_node
      end
    end

    popped_node.data
  end

  def delete(data)
    node = head_node

    if node.data == data
      self.head_node = node.next_node
    else
      while node.next_node
        if node.next_node.data == data
          return node.next_node = node.next_node.next_node
        end
        node = node.next_node
      end
    end
  end

  def last_node
    node = head_node
    while node
      return node unless node.next_node
      node = node.next_node
    end
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
    while node
      data_for_nodes << node.data
      node = node.next_node
    end

    data_for_nodes
  end

  def find(data)
    node = head_node
    while node
      return node if node.data == data
      node = node.next_node
    end
  end

  def insert(index, data)
    current_index = 0
    node = head_node
    until current_index + 1 == index
      node = node.next_node
    end
    node.next_node = Node.new(data, node.next_node)
  end

  def index(data)
    node = head_node
    index = 0
    while node
      return index if node.data == data
      node = node.next_node
      index += 1
    end
  end

  def insert_after(target_node, data)
    node = head_node
    while node
      if node.data == target_node
        new_node = Node.new(data, node.next_node)
        return node.next_node = new_node
      end
      node = node.next_node
    end
  end
end

class Node
  attr_reader :data
  attr_accessor :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

