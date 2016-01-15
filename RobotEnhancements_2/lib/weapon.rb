class Weapon < Item
  attr_reader :damage, :range
 def initialize(name, weight, damage)
    @damage = damage
    @range = 1
    super(name, weight)
  end 

  def hit(robot)
    robot.wound(damage)
  end 
end 