class Civilization
  attr_accessor :armies, :civilization

  def initialize(civilization)
    @civilization = civilization
    @armies = {}
    initialize_army
  end

  private

  def initialize_army
    self.armies = Army.new(civilization)
  end
end

class Chinese < Civilization
  INITIAL_UNITS = {
    pikeman: 2,
    archer: 25,
    knight: 2
  }.freeze
end
class English < Civilization
  INITIAL_UNITS = {
    pikeman: 10,
    archer: 10,
    knight: 10
  }.freeze
end
class Bizantine < Civilization
  INITIAL_UNITS = {
    pikeman: 5,
    archer: 8,
    knight: 15
  }.freeze
end
