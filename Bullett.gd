extends Area2D

var velocity: Vector2
var explosion_scene = preload("res://bomboclat.tscn")
var explosion_instance

func launch(direction: Vector2, speed: float):
	velocity = direction * speed

func _physics_process(delta):
	position += velocity * delta

	if position.length() > 1000:
		queue_free()

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
		explosion_instance = explosion_scene.instantiate()
		get_parent().add_child(explosion_instance)
		explosion_instance.global_position = global_position
		var animation = explosion_instance.get_node("AnimatedSprite2D")
		animation.play("explosion_animation")
