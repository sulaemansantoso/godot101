extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var max_speed = 100
var acceleration = 5;
var movement = Vector2(0,0)
var gravity = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
#	var adjusted_speed = speed * delta 
#	adjusted_speed = speed
	movement.y += gravity
	
	if (Input.is_action_pressed("Maju")):
#		movement.x += acceleration
#		movement.x = min(movement.x , max_speed)
		movement.x = min (movement.x + acceleration, max_speed)
		
	elif (Input.is_action_pressed("Mundur")):
		movement.x -= acceleration 
		if (movement.x < -max_speed):
			movement.x = -max_speed
#	else :
#		movement.x = 0

	if (Input.is_action_pressed("Atas")):
		movement.y -= acceleration
	elif (Input.is_action_pressed("Bawah")):
		movement.y = movement.y + acceleration # movement.y += acceleration
#	else :
#		movement.y = 0
		
	
#	move_and_collide(movement)	
	move_and_slide(movement)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
