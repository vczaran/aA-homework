class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      self.take_turn
      system("clear")
    end

    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    unless @game_over
      self.round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    self.add_random_color
    puts "#{seq}"
    sleep(2)
    system("clear")
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