class OneDigitProblem < Problem

  attr_reader :operator

  def initialize
    @operator = nil
  end

  def question=
    num1 = rand(10) + 1
    num2 = rand(10) + 1

    if self.operator
      @answer = num1.send(self.operator, num2)
    else
      raise "No operator defined for this problem."
    end

    @question = "#{num1} #{self.operator} #{num2} = ?"
  end

end
