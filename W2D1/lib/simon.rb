class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    self.take_turn until @game_over == true
    if @game_over == true
      self.game_over_message
      self.reset_game
    end
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if @game_over == false
      self.round_success_message   
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    @seq.each do |color|
      system("clear")
      puts color
      sleep(1)
      system("clear")
      sleep(0.1)
    end
    system("clear")
  end

  def require_sequence
    @seq.each do |color|
      system("clear")
      puts "Enter color: "
      if gets.chomp.downcase != color
        @game_over = true
        return
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Round success"
    sleep(0.5)
  end

  def game_over_message
    puts "Game is over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

game = Simon.new
game.play