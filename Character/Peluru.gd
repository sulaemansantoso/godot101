extends RigidBody2D

func _physics_process(delta):
	pass

func _integrate_forces(state):
	pass
	
func _dorongPeluru(gerakan) :
	apply_central_impulse(gerakan)


func _on_Peluru_body_entered(body):
	if (body is TileMap) :
		$AnimationPlayer.play("Meledak")
		
	
	if (body.is_in_group("enemies")):
		$AnimationPlayer.play("Meledak")
		print("hit enemy")
		body.emit_signal('enemy_hit')
		
		
	pass # Replace with function body.
