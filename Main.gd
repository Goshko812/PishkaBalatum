extends Node

var enemy_scene = preload("res://Enemy.tscn")


func _ready():
	$Timer.start()

func _on_Timer_timeout():
	spawn_enemy()

func spawn_enemy():
	if enemy_scene:  
		var new_enemy = enemy_scene.instantiate()
		new_enemy.position = random_position()
		add_child(new_enemy)
		print("enemy spawned")

func random_position() -> Vector2:
	return Vector2(randi() % 4000, randi() % 4000)
