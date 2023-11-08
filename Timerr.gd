extends Node

func _on_Timer_timeout():
	spawn_enemy()

func spawn_enemy():
	if $Enemy:  # Assuming your enemy node is named "Enemy"
		$Enemy.position = random_position()

func random_position() -> Vector2:
	return Vector2(randi() % 4000, randi() % 4000)
