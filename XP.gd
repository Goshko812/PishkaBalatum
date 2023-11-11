extends AnimatedSprite2D


var player = preload("res://Player.gd")
var move_speed : float = 100.0
var is_moving : bool = false

func _ready():
	player = $"/root/World/Player" #Ne znam dali e taka na 100%

func _process(delta):
	if is_moving:
		move_towards_player(delta)

func move_towards_player(delta):
	var direction = (player.global_position - global_position).normalized()
	global_position += direction * move_speed * delta

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		is_moving = true
