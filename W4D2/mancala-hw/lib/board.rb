class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new([])}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      unless i == 6 || i == 13
        4.times do
          cup << :stone
        end
      end
    end
  end


  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise "Invalid starting cup"
    end

    if @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    @cups[start_pos].take

    Board.render
    next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if @cups[ending_cup_idx].empty?
      return :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (@cups[0...6].all? { |cup| cup.empty?}) || (@cups[7...13].all? { |cup| cup.empty?})
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      return :draw
    elsif player1_count > player2_count
      return @name1
    else
      @name2
    end
  end
end