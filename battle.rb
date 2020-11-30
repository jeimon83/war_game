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


english = Civilization.new('English')
chinese = Civilization.new('Chinese')
bizantine = Civilization.new('Bizantine')

battle0 = Battle.new(english, english)
battle0.fight!

battle1 = Battle.new(english, chinese)
battle1.fight!
english.armies.train(english.armies.units[4])
english.armies.transform(english.armies.units[17])

battle2 = Battle.new(english, bizantine)
battle2.fight!
bizantine.armies.train(bizantine.armies.units[2])
bizantine.armies.transform(bizantine.armies.units[9])

battle3 = Battle.new(chinese, bizantine)
battle3.fight!
chinese.armies.train(chinese.armies.units[12])
bizantine.armies.transform(bizantine.armies.units[20])

battle4 = Battle.new(chinese, bizantine)
battle3.fight!
chinese.armies.train(chinese.armies.units[12])
bizantine.armies.transform(bizantine.armies.units[20])

puts "English Battles: #{english.armies.counter}" # Should be 2 battles
puts "Chinese Battles: #{chinese.armies.counter}" # Should be 3 battles
puts "Bizantine Battles: #{bizantine.armies.counter}" # Should be 3 battles
puts "END"