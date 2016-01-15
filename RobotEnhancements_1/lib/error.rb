class RobotAlreadyDeadError < StandardError
  def initialize
    super("Opss!!!!! This Robot is dead, it cannot be revived")
  end
end 

class UnattackableEnemy < StandardError
  def initialize
    super("This is not a Robot and you just can attack a Robot")
  end
end