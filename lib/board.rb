# frozen_string_literal: true

require_relative 'a_star'
# The Board class contains a representation of the current chessboard state,
# also asks the user for the position he wants the knight to start,
# and where he should go to
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, ' ') }
  end

  # Print on the terminal a visual representation of a chess board
  # including the knight position if there's a knight on the grid
  def print_board
    i = 0
    top_numbers
    while i < 8

      grid_draw_odds(i)
      puts
      grid_draw_evens(i)
      puts
      i += 2
    end
    bottom_numbers
  end

  def top_numbers
    puts "\e[100m Y                            \e[0m"
  end

  def bottom_numbers
    puts "\e[100m X->1  2  3  4  5  6  7  8    \e[0m"
  end

  def grid_draw_odds(x_pos)
    j = 0
    print "\e[100m #{x_pos + 1} \e[0m"
    while j < 7
      print "\e[40m #{grid[x_pos][j]} \e[0m\e[47m\e[30m #{grid[x_pos][j + 1]} \e[0m"
      j += 2
    end
    print "\e[100m   \e[0m"
  end

  def grid_draw_evens(x_pos)
    j = 0
    print "\e[100m #{x_pos + 2} \e[0m"
    while j < 7
      print "\e[47m\e[30m #{grid[x_pos + 1][j]} \e[0m\e[40m #{grid[x_pos + 1][j + 1]} \e[0m"
      j += 2
    end
    print "\e[100m   \e[0m"
  end

  # Add the knight to the grid
  def knight_on_board(knight)
    return if knight.nil?

    grid[knight[1] - 1][knight[0] - 1] = 'K'
  end

  def destination_on_board(goal)
    grid[goal[1] - 1][goal[0] - 1] = "\e[31mK"
  end

  # Remove the knight from the grid
  def clean_grid
    @grid = Array.new(8) { Array.new(8, ' ') }
  end

  # Call for the pathfinding algo with the initial and final
  # positions estabilished by the user
  def solve
    print_board
    puts "\e[36mWhat is the start position?\e[0m"
    knight = Knight.new(position_x, position_y)
    puts "\e[36mWhat is the end position?\e[0m"
    goal_positions = [position_x, position_y]
    goal = Node.new(goal_positions[0], goal_positions[1])

    pathfinding = AStar.new(knight, goal)
    moves = pathfinding.movements
    draw_moves(moves, goal_positions)
  end

  # Get a position on the board from the user
  def position_x
    condition = false
    position = 0
    until condition
      print 'Give a X (from 1 to 8) position: '
      position = gets.chomp.to_i
      condition = valid_position?(position)
    end
    position
  end

  def position_y
    condition = false
    position = 0
    until condition
      print 'Give a Y (from 1 to 8) position: '
      position = gets.chomp.to_i
      condition = valid_position?(position)
    end
    position
  end

  # Check if a position given is present on the chess board
  def valid_position?(position)
    return true if position.positive? && position < 9

    puts 'INVALID POSITION'
    false
  end

  # Print the movements the knight made on the terminal
  # with a chess board visualization
  def draw_moves(array, goal)
    move_number = 0
    array.each do |move|
      knight_on_board(move)
      destination_on_board(goal) unless goal == move
      puts "\nStarting Position:" if move_number.zero?
      puts "Move number: #{move_number}" if move_number.positive?
      print_board
      clean_grid
      move_number += 1
    end
  end
end
