extends Area2D

var velocity: Vector2
var explosion_scene = preload("res://bomboclat.tscn")
var explosion_instance

#damage up bullshit
var damage: int = 50

func launch(direction: Vector2, speed: float, damage_bonus: int):
	velocity = direction * speed
	damage+=damage_bonus

func _physics_process(delta):
	position += velocity * delta

	if position.x < 0 or position.x > 4000 or position.y < 0 or position.y > 4000:
		queue_free()

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		print("Bullet damage:",damage)
		body.take_damage(damage)
		
		##explosion logic
		explosion_instance = explosion_scene.instantiate()
		get_parent().add_child(explosion_instance)
		explosion_instance.global_position = global_position
		var animation = explosion_instance.get_node("AnimatedSprite2D")
		animation.play("explosion_animation")
