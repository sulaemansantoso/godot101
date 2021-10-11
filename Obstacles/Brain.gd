extends Area2D

signal brain_keambil

export var point = 10

func _bila_ada_masuk(body):
	$AnimationPlayer.play("Taken")
	 # Replace with function body.

func _die() :
	emit_signal("brain_keambil", point)
#	get_tree().call_group("scene1", "_on_Tambah_Point",point)
	queue_free()
