class Army
  attr_accessor :civilization, :gold_coins, :units, :counter

  def initialize(civilization)
    @civilization = civilization
    @gold_coins = 1000
    @units = []
    @counter = 0
    initialize_units
  end
  
  def count!
    self.counter += 1
  end

  def total_points
    units.sum(&:points)
  end

  def increment_coins(quantity)
    self.gold_coins += quantity
  end

  def remove_top_units(quantity)
    mighty_unit = units.max_by(&:points)
    mighty_unit.points -= quantity
  end
  
  def train(unit)
    return if self.gold_coins < unit.class::TRAINING_COST

    unit.points += unit.class::TRAINING_POINTS
    self.gold_coins -= unit.class::TRAINING_COST
  end

  def transform(unit)
    return if unit.class.to_s.eql? 'Knight'
    return if self.gold_coins < unit.class::TRANSFORM_COST

    position = units.index(unit)
    case unit.class.to_s
    when 'Pikeman'
      units[position] = Kernel.const_get(unit.class::TRANSFORM_TO).new
      reduce_coins(unit.class::TRANSFORM_COST)
    when 'Archer'
      units[position] = Kernel.const_get(unit.class::TRANSFORM_TO).new
      reduce_coins(unit.class::TRANSFORM_COST)
    end
  end

  private

  def initialize_units
    Kernel.const_get(civilization)::INITIAL_UNITS.each do |key, value|
      value.times do
        units << Kernel.const_get(key.to_s.capitalize).new
      end
    end
  end

  def reduce_coins(quantity)
    self.gold_coins -= quantity
  end
end