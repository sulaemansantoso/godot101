extends Node2D


var point = 0
var enemy_point = 0

func _get_Point():
	return point


func _ready():
	
	var file = File.new()
	file.open("user://zombiesavean.dat", File.READ)
	point = file.get_64()
	file.close()

#	$Brain.connect("brain_keambil" , self ,"_on_Tambah_Point")
#	$Brain2.connect("brain_keambil", self, "_on_Tambah_Point")
#	$AdMob.load_banner()
#	$AdMob.load_interstitial()
	$AdMob.load_rewarded_video()

	var kump_brain
	kump_brain = $Brains.get_children()
	$GUI.UpdatePoint(point)
	$GUI.UpdateLives($Zombie._get_lives())	

#	for i in range(0, kump_brain.size()):
#		print(kump_brain[i].name)
	
	for brain in kump_brain : 
		brain.connect("brain_keambil", self, "_on_Tambah_Point")
	var kump_musuh
	kump_musuh = $KumpMusuh.get_children()
	
	for musuh in kump_musuh : 
		musuh.connect("player_hit", self, "_on_player_hit")
		musuh.connect("enemy_hit", self, "_on_enemy_hit")
	pass

func _on_enemy_hit() :
	enemy_point += 10
	print( "hancurkan musuh : " +  str(enemy_point))
	
func _on_player_hit(damage , enemy_pos) :
	$Zombie._get_hit(damage, enemy_pos)
	$GUI.UpdateLives($Zombie._get_lives())
	
	if ($Zombie._get_lives() <= 0):
		#mati .. kita restart
		get_tree().reload_current_scene()

func _process(delta):
#	if (Input.is_action_just_pressed("testing")):
#		get_tree().call_group("brains", "queue_free")
	pass


func _on_Tambah_Point(p):
	point += p
	$"/root/Vars".point = point
	
	$GUI.UpdatePoint(point)
	print(point)
	var kump_musuh = $Brains.get_child_count()
	if (kump_musuh == 1) :
		$Portal.emit_signal("player_win")
	



func _on_AdMob_banner_failed_to_load(error_code):
	$GUI/Label.text = "banner failed " + str(error_code)
	pass # Replace with function body.


func _on_AdMob_banner_loaded():
	$GUI/Label.text = "banner loaded"
	pass # Replace with function body.


func _on_AdMob_interstitial_failed_to_load(error_code):
	$GUI/Label.text = "inter failed " + str(error_code)
	pass # Replace with function body.
	
	
func _on_AdMob_interstitial_loaded():
	$GUI/Label.text = "inter loaded"
	
	pass # Replace with function body.


func _on_AdMob_rewarded_video_failed_to_load(error_code):
	$GUI/Label.text = "reward failed " + str(error_code)
	pass # Replace with function body.


func _on_AdMob_rewarded_video_loaded():
	$GUI/Label.text = "reward loaded"
	pass # Replace with function body.


func _on_TouchScreenButton_pressed():
#	$AdMob.show_banner()
#	$AdMob.show_interstitial()
	$AdMob.show_rewarded_video()
	pass # Replace with function body.


func _on_AdMob_rewarded(currency, ammount):
	$GUI/Label.text = "reward gained"
	
	pass # Replace with function body.
