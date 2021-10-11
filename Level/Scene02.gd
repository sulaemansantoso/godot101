extends Node2D

func _ready() :
	$CanvasLayer/Control/Label.text = "score anda :" + str($"/root/Vars".point)
