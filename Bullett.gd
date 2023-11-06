extends Area2D

var velocity: Vector2

func launch(direction: Vector2, speed: float):
	velocity = direction * speed

func _physics_process(delta):
	position += velocity * delta

	if position.length() > 1000:
	#if position.x > 800 or position.x < 0 or position.y > 600 or position.y < 0:
		queue_free()
func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
		queue_free()
