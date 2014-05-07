class Problem < ActiveRecord::Base

  validates :question, :answer, presence: true, allow_nil: true
  validates :question, uniqueness: true
  validates :skipped, :answered, :correct, inclusion: { in: [ true, false ] }

  # potentially a way to get "All Problems Attempted, ever"
  # and corresponding for "Total Ans'd" and "Total %age Correct"
  # def self.all_attempted
  #   Problem.where(attempted: true)
  # end

  def initialize(question = nil, answer = nil)
    @question = "Your #{self.class} here."
  end

  def self.num_attempted
    self.where(attempted: true).count
    # || self.count - self.where(skipped: true).count
  end

  def self.num_correct
    self.where(correct: true).count
  end

  def self.num_skipped
    self.where(skipped: true).count
  end

  def self.success_percentage
    self.num_correct / self.num_attempted
  end

  def display
    "Solve: #{self.question}"
  end

  def answer_question
    puts "Input your answer: "
    ans = gets.chomp
    if ans.present
      self.skipped = false
      self.answered = true
    end

    (self.correct = true) if compare_answer(ans)
  end

  def correct_answer?(given_answer)
    self.answer == given_answer
  end


  private
  def question=
    #intentionally blank
  end

  def answer=(ans)
    @answer = ans
  end
end
