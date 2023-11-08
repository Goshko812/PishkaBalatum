extends Timer

var enemy_instance

func _on_Timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var enemy_instance = $Enemy2
	if enemy_instance:
		enemy_instance.position = random_position()

func random_position() -> Vector2:
	return Vector2(randi() % 4000, randi() % 4000)
