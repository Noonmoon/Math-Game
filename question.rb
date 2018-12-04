class Question
  attr_accessor :num1, :num2, :question, :solution

  def initialize
    @num1 = rand(5..30)
    @num2 = rand(5..30)
    @question = nil
    self.create_question
  end

  def create_question
    op = %w{+ - *} .sample
    self.question = "#{num1} #{op} #{num2}"
    self.solution = eval(self.question)
  end

  def check_answer(response)
    question = self.question
    answer = eval(question)

    if (answer == response)
      puts "Thats correct!"
    else
      puts "Better luck next time"
    end
    answer == response
  end

end
