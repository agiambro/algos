class GameBoard
  VALID_NUMBERS = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize *board
    @board = board
  end

  def layout
    @board.flatten
  end

  def next_moves
    row_1 = @board[0..8]
    non_blanks = row_1.reject!{|i| i == 0}
    possible_moves = VALID_NUMBERS - non_blanks
    possible_moves.each_with_object([]) do |i, accum|
      board_copy = @board.clone
      board_copy[0] = i
      accum << GameBoard.new(*board_copy).layout
    end[0...-1]
  end
end