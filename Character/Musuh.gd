extends KinematicBody2D

var speed = 100
var arah = -1 #-1 gerakannya kiri 1 gerakan kanan
var damage = 15


signal player_hit
signal enemy_hit

func _physics_process(delta):
	
	#balik arah
	# kalo kena tembok
	# depannya jurang
	if (is_on_wall() or (not $RayCast2D.is_colliding())):
		arah = arah * -1
		$RayCast2D.position.x *= -1
		$Sprite.flip_h = !$Sprite.flip_h		
	
	#gerakan x
	var gerakan = Vector2(arah * speed, 0)
#	if (gerakan.x > 0):
#		$Sprite.flip_h = true
#	else : 
#		$Sprite.flip_h = false
	
	#gravitasi
	if(!is_on_floor()):
		gerakan.y = 200	
	
	move_and_slide(gerakan, Vector2.UP)
	
func _kena_tembak():
	$AnimationPlayer.play("Dead")
	pass


func _on_HitArea_body_entered(body):
	
	if (body.is_in_group("player")):
		emit_signal("player_hit", damage , position)
	
	

