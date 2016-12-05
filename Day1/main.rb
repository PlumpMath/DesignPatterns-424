require_relative 'oracle.rb'
require_relative 'evaluation.rb'
require_relative 'EvaluationStrategies/random_evaluation.rb'
require_relative 'EvaluationStrategies/linear_evaluation.rb'
require_relative 'EvaluationStrategies/smart_random_evaluation.rb'
require_relative 'EvaluationStrategies/binary_search_evaluation.rb'
require_relative 'EvaluationStrategies/reverse_linear_evaluation.rb'


class GuessGame
  attr_writer :scoring_strategy
  def score_performance
    @scoring_strategy.evaluate
  end
end

# Evaluate the performance of participants using different guessing strategies

game = GuessGame.new

game.scoring_strategy = RandomEvaluation.new
game.score_performance

game.scoring_strategy = LinearEvaluation.new
game.score_performance

game.scoring_strategy = SmartRandomEvaluation.new
game.score_performance

game.scoring_strategy = BinarySearchEvaluation.new
game.score_performance

game.scoring_strategy = ReverseLinearEvaluation.new
game.score_performance
