# frozen_string_literal: true

require_relative 'node/knight'
require_relative 'node'
# A* algorithm
class AStar
  def initialize(start = Knight.new(0, 0), goal = Node.new(7, 7))
    @open_list = [start] # Valid moves queue
    @closed_list = []
    @goal = goal
  end

  def search
    until @open_list.empty?
      parent = @open_list.min # Parent = the node with the lowest f value

      @open_list.delete(parent)
      parent.develop_knight # Develop possible moves for the parent
      child = parent.moves_array # Child = an array with those possible moves

      inspect = child_inspect(child)
      return inspect if inspect.instance_of? Knight

      @closed_list << parent
    end
  end

  # Inspect each child for three conditions:
  # Is child in the goal?
  # If yes return child, we found the last move!
  # Is there a better option then child already in the queue?
  # Was a better option the child already discarded?
  # If no add child to the queue as a possible good move!
  def child_inspect(child_array)
    child_array.each do |child|
      next if child.nil?

      return child if child.x == @goal.x && child.y == @goal.y

      child = calculate_f(child)
      next if better_option?(child, @open_list) || better_option?(child, @closed_list)

      @open_list << child
    end
    false
  end

  # Sum the value of f using the G and H parameters
  # G is the movement distance from the initial position
  # each knight move adds 1 distance
  # H is a heuristic of the cost of this move from the starting position
  # I'm using a modified manhattan that gave me the best results as the heuristic
  def calculate_f(child)
    child.g = child.parent.g + 1
    child.h = manhattan(child)
    child.f = child.g + child.h
    child
  end

  # The heuristic used to calculate H, a modified manhattan taking account of the knights
  # move pattern
  def manhattan(node)
    (((node.x - @goal.x).abs * 2) + (node.y - @goal.y * 3).abs)
  end

  # Bool method to check if a better option than the current child was already found
  def better_option?(node, list)
    list.any? do |item|
      item.x == node.x && item.y == node.y && item.f < node.f
    end
  end

  # The main output method of the class
  # Get the result from the search algorithm and traces back
  # through the child nodes until it reaches the starting point
  # then print to the terminal the amount o moves made and
  # return a array containing all the moves, from start to finish
  def movements
    node = search
    count = 0
    move_array = []
    until node.nil?
      move_array << [node.x, node.y]
      node = node.parent
      count += 1
    end
    puts "\e[32mThe knight took #{count - 1} moves!\e[0m"
    move_array.reverse
  end
end
