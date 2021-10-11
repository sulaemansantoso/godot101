extends Area2D

signal player_win

export var scene_berikut : PackedScene

func _init():
	visible = true


func _pindah_scene() :
	if (visible == true) :
		get_tree().change_scene_to(scene_berikut)
#		get_tree().change_scene("res://Level/Scene02.tscn")
#		get_tree().change_scene(scene_berikut)
	
	pass


func _on_Portal_body_entered(body):
	$AnimationPlayer.play("Whoosh")
	get_tree().paused = true
	pass # Replace with function body.


func _on_Portal_player_win():
	visible = true
	print("portal visible")
