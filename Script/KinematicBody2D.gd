extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var movement = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var gravity = 100
var speed = 100
var max_speed = 400
var min_speed = -400

func _physics_process(delta):
#	movement.y += gravity
	movement = Vector2(0,0)
	
	if (Input.is_action_pressed("Maju")):
		movement.x  = speed *delta
#		movement.x = speed
	elif (Input.is_action_pressed("Mundur")):
		movement.x  = -speed * delta
#		movement.x = -speed
	if (Input.is_action_pressed("Atas")):
		movement.y = -speed * delta;
#		movement.y = -speed
	elif (Input.is_action_pressed("Bawah")): 
		movement.y = speed * delta;
#		movement.y = speed	
#	else :
#		movement.x = 0
#	movement.y = 0
		
	print (movement)
	move_and_collide(movement)
	
#	move_and_slide(movement)
#	var collision = move_and_collide(movement);
#	print(collision)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
