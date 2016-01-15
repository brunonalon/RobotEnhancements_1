class Robot
  MAX_WEIGHT_ITEM = 250

  attr_accessor  :equipped_weapon
  attr_reader :position, :items, :health

  def initialize
    @position = [0, 0]
    @items = []
    @health = 100
    @equipped_weapon
  end 

  def move_left
    position[0] -=1
  end 
  def move_right
    position[0] +=1
  end 

  def move_up
    position[1] +=1
  end 

  def move_down
    position[1] -=1
  end 

  def pick_up(item)
    @equipped_weapon = item if item.is_a?(Weapon)
    if items_weight < MAX_WEIGHT_ITEM
      @items.push(item)
    else
      false
    end 
  end 

  def items_weight
    if items.empty?
      0
    else
      items_weisht_var = 0
      items.each do |item| 
        items_weisht_var += item.weight 
      end
      items_weisht_var
    end 
  end 

  def wound(points)
    if @health > 0 && @health >= points
      @health -= points 
    else
      @health= 0
    end 
  end

  def heal(points)
     if @health <= 100 && points <= (100 - @health)  
      @health += points 
    else
      @health = 100
    end 
  end 

  def heal!(points) 
    #raise StandardError.new('Opss!!!!! This Robot is dead, it cannot be revived') if @health == 0  
    raise RobotAlreadyDeadError.new if @health == 0  
    heal(points) 
  end 

  def attack(robot)
    if equipped_weapon == nil
      robot.wound(5)
    else
      equipped_weapon.hit(robot) 
    end
  end 

  def attack!(robot)
    raise UnattackableEnemy unless robot.is_a?(Robot)
    attack(robot)
  end 

end
