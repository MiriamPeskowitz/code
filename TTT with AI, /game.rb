class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = []
  needs arrays for each winning combinations.
  constants used for all caps
  0,1,2
  3,4,5
  6,7,8
  0,4,8
  1,4,7
  2,4,6
  0,4,8,
  0,3,6
  2,5,8
  and more. see screenshot

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("0"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
    @board.cells[combo[0]]== @board.cells[combo[1]] &&
    @board.cells[combo[1]] == @board.cells[combo[2]] &&
    @board.taken?(combo[0] + 1)
    will return the combination
  end

  def draw?
    @board.full?  && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      @board.cells[winning_comb0[0]]
  end

 end
