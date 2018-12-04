class Player
  attr_accessor :lives, :player_id, :current

  def initialize(numb)
    @player_id = numb
    @lives = 3
    @current = false
  end

  def remove_life
    self.lives -= 1
  end
end
