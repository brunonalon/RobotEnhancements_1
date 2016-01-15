require_relative 'error' 
require_relative 'robot'
require_relative 'item'
require_relative 'weapon'
require_relative 'box_of_bolts'
require_relative 'laser'
require_relative 'plasma_cannon'



robot = Robot.new

robot.attack!(100)
