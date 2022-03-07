extends KinematicBody2D

const scenePeluru = preload("res://Character/Peluru.tscn")

export var speed = 100
var movement = Vector2(0,0)
const accel = 50
const max_speed = 200
const gravity = 20
const jump_force = -500
const max_jump = 2
var power = 10
var jump_count = 0
export var lives = 100

func _get_lives() :
	return lives

func _set_lives(l) :
	lives = l

func _get_hit(damage, pos_musuh) :
	_set_lives(_get_lives()- damage)
	print(lives)
	var arah = (pos_musuh - position).normalized()
	var pantul = Vector2(-arah * 2500)
	move_and_slide(pantul, Vector2.UP, false, 4, PI/4, false)
	set_modulate(Color(1,0,0,1)) #ubah jadi merah
	$Timer.start() #tunggu 0.25s
	
func _on_Timer_timeout():
	set_modulate(Color(1,1,1,1)) #balikin ke biasa
	pass # Replace with function body.
	

func _physics_process(delta):

	if (is_on_ceiling()):
		movement.y = 0
	if (not is_on_floor()):
		movement.y += gravity
	else : 
		movement.y = 0
		jump_count = 0
		movement.x = lerp(movement.x, 0, 0.1)
#		movement.x = lerp(movement.x, 0, 0.1) #perlambatan sebesar 0.1 setiap kali process dipanggil	
		
	
	if (Input.is_action_pressed("Maju") ):	
		movement.x += accel
		movement.x = min(movement.x , max_speed)	
	elif (Input.is_action_pressed("Mundur") ):
		movement.x -= accel # movement.x = movement.x - acccel
		movement.x = max(movement.x , -max_speed) # (-150,-100)
		
	if (Input.is_action_pressed("Atas")):
		movement.y = max(movement.y - accel, -max_speed)
	elif (Input.is_action_pressed("Bawah")):
		movement.y = min(movement.y + accel, max_speed)
		if (is_on_floor()):
			$Cam.offset.y = clamp($Cam.offset.y + 10,0, 100 ) 
	else : 
		if ($Cam.offset.y != 0):
			$Cam.offset.y = lerp($Cam.offset.y , 0, 0.1)
	
	if (Input.is_action_just_pressed("Lompat") and
		( is_on_floor() or (jump_count < max_jump)) ):	
		#load suara pasang ke sound stream
		var audiostream = ResourceLoader.load("res://Audio/jumping.wav")
		$ZombieSound.stream = audiostream 
		#baru kita play
		$ZombieSound.play()
	
		
		movement.y = jump_force
		jump_count += 1
	
	if (movement.x > 0) : # menghadap ke kanan
		$KarakterUtama.flip_h = false
	elif(movement.x < 0) : 
		$KarakterUtama.flip_h = true
	
	if (Input.is_action_just_pressed("Tembak")):
		power = 0
	elif (Input.is_action_pressed("Tembak")):
		power += 10
	elif (Input.is_action_just_released("Tembak")) :
		var peluruBaru = scenePeluru.instance()
		get_tree().current_scene.add_child(peluruBaru)
		peluruBaru.global_position = global_position
		if($KarakterUtama.flip_h == true):
			peluruBaru._dorongPeluru(Vector2(power *-1,0))
		else :
			peluruBaru._dorongPeluru(Vector2(power,0))
			
		
		
	
	
	move_and_slide_with_snap(movement,Vector2(0,2), Vector2(0,-1), false, 4, PI/4, false)
#	move_and_slide(movement, Vector2(0,-1), false, 4, PI/4, false)
	
	if (get_slide_count() >0) :
		for i in get_slide_count():
			var benda = get_slide_collision(i)
			if (benda.collider is RigidBody2D) :
				benda.collider.apply_central_impulse(movement)
			
	
	

