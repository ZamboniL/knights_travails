# frozen_string_literal: true

# Node that contains the important methods for the a* algorithm
class Node
  attr_accessor :g, :h, :x, :y, :dicovered, :f, :parent

  include Comparable

  def initialize(x_coord, y_coord, parent = nil)
    @x = x_coord
    @y = y_coord
    @g = 0
    @h = 0
    @f = 0
    @parent = parent
  end

  def <=>(other)
    value = other.instance_of?(Node) || other.instance_of?(Knight) ? other.f : other

    f <=> value
  end
end
