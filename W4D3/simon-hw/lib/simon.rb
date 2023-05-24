class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over = true
      self.take_turn
    end

    if @game_over = true
    puts game_over_message
    self.reset_game
    end
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    if @game_over = true
      puts game_over_message
    elsif @game_over = false
      puts round_success_message
    end

    @sequence_length += 1
  end

  def show_sequence
    self.add_random_color
    puts "#{seq}"
    sleep(2)
  end

  def require_sequence
    puts "Input the sequence of colors as a string separated by spaces:"
    input = [gets.chomp]

    if input.length > seq.length || input != seq
      @game_over = true
    else
      @game_over = false
    end

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
      puts "Success!"
  end

  def game_over_message
      puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end