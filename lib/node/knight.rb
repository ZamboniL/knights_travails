# frozen_string_literal: true

require_relative '../node'
# Inherits from Node and adds the method to create and get all possible movements of a knight
class Knight < Node
  attr_accessor :up_right, :up_left, :right_up,
                :right_down, :down_right, :down_left,
                :left_up, :left_down

  # create the positions variables for the possible knights movements
  def develop_knight
    @up_right = new_position(1, -2)
    @up_left = new_position(-1, -2)
    @right_up = new_position(2, -1)
    @right_down = new_position(2, 1)
    @down_right = new_position(1, 2)
    @down_left = new_position(-1, 2)
    @left_up = new_position(-2, -1)
    @left_down = new_position(-2, 1)
  end

  # Return a array with all the knights in their new positions
  def moves_array
    [up_right, up_left, right_up, right_down, down_right, down_left, left_up, left_down]
  end

  # Calculates the position given how much they move on x and y axys
  # If it would be a invalid move, return nil
  def new_position(x_movement, y_movement)
    new_position = []
    new_position << x + x_movement
    new_position << y + y_movement
    return Knight.new(new_position[0], new_position[1], self) if new_position.all? { |i| i.positive? && i <= 8 }

    nil
  end
end
