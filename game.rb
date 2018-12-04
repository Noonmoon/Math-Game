require_relative 'player.rb'
require_relative 'question.rb'

class Game
  attr_accessor :player1, :player2

  def initialize
    puts "welcome"
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    self.player1.current = true
    self.round
  end

  def round
    while game_win
      current = self.current_player
      question = Question.new
      puts "player#{current.player_id}: What does #{question.question} equal"
      print ">"
      response = gets.chomp().to_i
      current_player.remove_life unless question.check_answer(response)
      self.switch_current
      self.response
    end
  end

  def response
    if game_win
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      puts "----- NEXT ROUND -----"
    else
       if self.player1.lives == 0
         puts "Player 2 wins with a score of #{player2.lives}/3"
       else
         puts "Player 1 wins with a score of #{player1.lives}/3"
       end
      puts "----- GAME OVER -----"
    end
  end

  def game_win
    if self.player1.lives == 0 || self.player2.lives == 0
      return false
    else
      return true
    end
  end

  def current_player
    if self.player1.current
      return self.player1
    elsif self.player2.current
      return self.player2
    end
  end

  def switch_current
    if self.player1.current == true
      self.player1.current = false
    else
      self.player1.current = true
    end

    if self.player2.current == true
      self.player2.current = false
    else
      self.player2.current = true
    end
  end

end
