class GameBoard
  VALID_NUMBERS = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize *board
    @board = board
  end

  def next_moves
    row = @board[0..8]
    non_blanks = row.reject!{|i| i == 0}
    possible_moves = VALID_NUMBERS - non_blanks
    puts "POSSIBLE #{possible_moves}"
  end
end