extends AnimatedSprite2D

var player = preload("res://Player.gd")
var move_speed : float = 100.0
var is_moving : bool = false
var disappear_threshold : float = 10.0 # twa moje da se promenq prosto 10 by default

func _ready():
	player = $"/root/World/Player" 

func _process(delta):
	if is_moving:
		move_towards_player(delta)
		check_distance()

func move_towards_player(delta):
	var direction = (player.global_position - global_position).normalized()
	global_position += direction * move_speed * delta

func check_distance():
	var distance_to_player = global_position.distance_to(player.global_position)
	if distance_to_player < disappear_threshold:
		queue_free()

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		is_moving = true
		body.gain_xp(25)
