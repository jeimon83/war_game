require './files/army'
require './files/civilization'
require './files/unit'
class Battle
  attr_accessor :fighter1, :fighter2

  def initialize(fighter1, fighter2)
    @fighter1, @fighter2 = [fighter1, fighter2]
  end

  def fight!
    count_armies_battles
    return remove_units if battle_result[:tie]

    battle_result[:winner].armies.increment_coins(100)
    battle_result[:looser].armies.remove_top_units(2)
  end

  private

  def count_armies_battles
    fighter1.armies.count!
    fighter2.armies.count!
  end

  def remove_units
    fighter1.armies.remove_top_units(2)
    fighter2.armies.remove_top_units(2)
  end

  def battle_result
    return { winner: fighter1, looser: fighter2, tie: false } if fighter1.armies.total_points > fighter2.armies.total_points
    return { winner: fighter2, looser: fighter1, tie: false } if fighter2.armies.total_points > fighter1.armies.total_points
    { tie: true }
  end
end
