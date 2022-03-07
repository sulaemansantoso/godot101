extends Node2D

export var tujuan = Vector2(0,0)
export var awal = Vector2(0,0)
export var kecepatan = 121.0

var pergi = true
export var waktu_tunggu = 0.5
var waktu = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	if (waktu > 0) :
		waktu -= delta
		if (waktu <= 0) :
			waktu = 0
	else : 
		var arah = Vector2(0,0)
		if (pergi) :
			arah = tujuan - $Body.position
		else :
			arah = awal - $Body.position
		if (arah.length() < kecepatan*delta):
			#sudah sampe ke titik tujuan
			pergi = !pergi
			waktu = waktu_tunggu
		arah = arah.normalized()
	#	$Body.move_and_slide(arah* kecepatan)
		$Body.position += arah * kecepatan* delta
