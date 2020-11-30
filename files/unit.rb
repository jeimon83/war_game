class Unit
  attr_accessor :points

  def initialize
    @points = self.class::INITIAL_POINTS
  end
end

class Pikeman < Unit
  INITIAL_POINTS = 5
  TRAINING_POINTS = 3
  TRAINING_COST = 10
  TRANSFORM_COST = 30
  TRANSFORM_TO = 'Archer'
end
class Archer < Unit
  INITIAL_POINTS = 10
  TRAINING_POINTS = 7
  TRAINING_COST = 20
  TRANSFORM_COST = 40
  TRANSFORM_TO = 'Knight'
end
class Knight < Unit
  INITIAL_POINTS = 20
  TRAINING_POINTS = 10
  TRAINING_COST = 30
end

