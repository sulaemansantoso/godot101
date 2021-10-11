extends CanvasLayer

func UpdatePoint(point_baru) :
	$Control/Panel/Point.text = str(point_baru)
	
func UpdateLives(lives) : 
	$Control2/LiveGUI.value = lives

func _ready():
	pass


func _on_UP5_pressed():
	Input.action_press("Mundur")
	
	pass # Replace with function body.


func _on_Right_pressed():
	Input.action_press("Maju")
	
	pass # Replace with function body.
